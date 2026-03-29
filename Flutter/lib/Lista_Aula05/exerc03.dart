import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Mantive a cor de fundo azul que você definiu
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exerc01 com Theme Data")),
      // 1. O SingleChildScrollView é essencial aqui para evitar o overflow vertical
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Primeiro bloco (Quadrado verde no fundo vermelho)
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.red,
                child: Container(color: Colors.green, width: 30, height: 30),
              ),

              SizedBox(height: 30),

              // Segundo bloco (OverflowBox protegido por um SizedBox)
              SizedBox(
                height: 50,
                child: OverflowBox(
                  minWidth: 0,
                  minHeight: 0,
                  child: Container(color: Colors.red, width: 100, height: 50),
                ),
              ),

              SizedBox(height: 30),

              // Terceiro bloco (Row com textos gigantes)
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinha os containers pelo topo
                children: [
                  Flexible(
                    flex: 1, // Distribui o espaço igualmente
                    child: Container(
                      color: Colors.red,
                      // Adicionei padding e centralizei o texto no container para não grudar nas bordas
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'This is a very long text that won\'t fit the line.',
                        style: TextStyle(fontSize: 100),
                        // O 'ellipsis' corta o texto e põe "..." se ficar muito grande
                        // Se você quiser que o texto desça em várias linhas (o que fará o scroll funcionar),
                        // mude as duas linhas abaixo para apenas: softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Goodbye!',
                        style: TextStyle(fontSize: 100),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
