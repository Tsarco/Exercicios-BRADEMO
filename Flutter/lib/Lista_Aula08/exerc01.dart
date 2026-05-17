import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//AVISO!!!
//PROFESSOR, N SEI SE O API VAI RODR COM SUCESSO NO SEU. AO TENTAR CRIAR A API
//DO GOOGLE CLOUD, ELE ME PEDIU PRA ENVIAR R$200 REAIS PARA ATIVAR. MESMO ASSIM CONSEGUI
//PEGAR UMA CHAVE DE API, MAS AO RODAR, ELE MOSTRA 'DEVELOPMENT PURPOSES' ACIMA DO GOOGLE MAPS.
//NÃO SEI SE ISSO SIGNIFICA QUE APENAS FUNCIONARIA PARA MIM, MAS QUERIA DEIXAR AVISADO. MEIO CONFUSO
//ISSO DA API DO GOOGLE MAPS.

void main() {
  runApp(const MaterialApp(home: GoogleMaps()));
}

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => GoogleMapsState();
}

class GoogleMapsState extends State<GoogleMaps> {
  final Completer<GoogleMapController> _controlador =
      Completer<GoogleMapController>();

  // Posição inicial default
  static const CameraPosition _posicaoInicial = CameraPosition(
    target: LatLng(-15.793889, -47.882778),
    zoom: 4.0,
  );

  // pino de localizacao
  Set<Marker> _marcadores = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Mapa Dinâmico'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _posicaoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controlador.complete(controller);
        },
        markers: _marcadores,
        myLocationEnabled: true,
        myLocationButtonEnabled:
            false, // Desativa botao padrao de Minha Localização
      ),

      //botao pra minha localizacao
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _irParaMinhaLocalizacao,
        label: const Text('Para minha localização!'),
        icon: const Icon(Icons.my_location),
      ),
    );
  }

  // vai pra localizacao
  Future<void> _irParaMinhaLocalizacao() async {
    bool servicoHabilitado;
    LocationPermission permissao;

    // ve se tem localizacao
    servicoHabilitado = await Geolocator.isLocationServiceEnabled();
    if (!servicoHabilitado) {
      _mostrarAviso('Os serviços de localização estão desativados.');
      return;
    }

    // ve se tem permissao
    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        _mostrarAviso('Permissões de localização negadas.');
        return;
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      _mostrarAviso('Permissões negadas permanentemente.');
      return;
    }

    // pega posicao atual
    Position posicaoAtual = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // vai pra posicao da camera
    CameraPosition cameraPosicaoAtual = CameraPosition(
      target: LatLng(posicaoAtual.latitude, posicaoAtual.longitude),
      zoom: 18.0,
      tilt: 45.0,
    );

    // animacaoe xtra de ir
    final GoogleMapController controlador = await _controlador.future;
    await controlador.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosicaoAtual),
    );

    // pino vermelho na localizacao q detecta
    setState(() {
      _marcadores = {
        Marker(
          markerId: const MarkerId('localizacao_atual'),
          position: LatLng(posicaoAtual.latitude, posicaoAtual.longitude),
          infoWindow: const InfoWindow(title: 'Você está aqui!'),
        ),
      };
    });
  }

  // aviso de erro
  void _mostrarAviso(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }
}
