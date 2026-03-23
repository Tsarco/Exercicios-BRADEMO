import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Widget Stack e Posicionado tbm",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: Text("verde"),
              ),
            ),

            Positioned(
              top: 40,
              left: 40,
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Text("vermelho"),
              ),
            ),

            Positioned(
              top: 60,
              left: 60,
              child: Container(
                color: Colors.purple,
                width: 100,
                height: 100,
                child: Text("roxo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
