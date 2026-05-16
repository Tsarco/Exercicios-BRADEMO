import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("configBox");

  runApp(const MaterialApp(home: TelaPrincipal()));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => TelaPrincipalState();
}

class TelaPrincipalState extends State<TelaPrincipal> {
  bool estaFocado = false;

  @override
  void initState() {
    super.initState();
    carregarEstado();
  }

  //pegar valor do hive
  Future<void> carregarEstado() async {
    final box = await Hive.openBox("configBox");
    setState(() {
      // Pega valor, ?? = se for nulo ent o default é false
      estaFocado = box.get("modo") ?? false;
    });
  }

  // muda modo
  Future<void> alternarModo() async {
    final box = await Hive.openBox("configBox");

    setState(() {
      estaFocado = !estaFocado;
    });

    // chave/valor
    box.put("modo", estaFocado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estaFocado ? Colors.green : Colors.blue,
      body: Center(
        child: ElevatedButton(
          onPressed: alternarModo,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text(
            estaFocado
                ? "Modo Focado"
                : "Modo Relax", //se modo focado true ent texto1, se n, texto2
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
