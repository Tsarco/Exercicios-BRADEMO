import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: TelaResponsiva(),
    );
  }
}

class TelaResponsiva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Capturamos a orientação da tela usando o MediaQuery
    var orientacao = MediaQuery.of(context).orientation;

    // Opcional: Você também poderia basear a responsividade na largura da tela
    // double screenWidth = MediaQuery.of(context).size.width;
    // bool isDesktop = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Layouts", style: TextStyle(fontSize: 16)),
        centerTitle: true,
      ),
      // 2. Usamos um if ternário simples para decidir qual layout renderizar
      body: orientacao == Orientation.portrait
          ? _layoutVertical()
          : _layoutHorizontal(),
    );
  }

  // ==========================================
  // LAYOUT RETRATO (PORTRAIT)
  // ==========================================
  Widget _layoutVertical() {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          "Cheetah Coding",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton("BOTAO 1", larguraGrande: false),
            _buildButton("BOTAO 2", larguraGrande: false),
          ],
        ),
        SizedBox(height: 40),
        Expanded(child: _buildList()),
      ],
    );
  }

  // ==========================================
  // LAYOUT PAISAGEM (LANDSCAPE)
  // ==========================================
  Widget _layoutHorizontal() {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cheetah Coding",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    _buildButton("BUTTON 1", larguraGrande: true),
                    SizedBox(height: 15),
                    _buildButton("BUTTON 2", larguraGrande: true),
                  ],
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(color: Colors.white54, width: 1),
        Expanded(child: _buildList()),
      ],
    );
  }

  // ==========================================
  // WIDGETS REUTILIZÁVEIS
  // ==========================================

  Widget _buildButton(String text, {required bool larguraGrande}) {
    return SizedBox(
      width: larguraGrande ? double.infinity : 120,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        Divider(color: Colors.white54, height: 1),
        _listItem('Dart'),
        Divider(color: Colors.white54, height: 1),
        _listItem('JavaScript'),
        Divider(color: Colors.white54, height: 1),
        _listItem('PHP'),
        Divider(color: Colors.white54, height: 1),
        _listItem('C++'),
        Divider(color: Colors.white54, height: 1),
      ],
    );
  }

  Widget _listItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
