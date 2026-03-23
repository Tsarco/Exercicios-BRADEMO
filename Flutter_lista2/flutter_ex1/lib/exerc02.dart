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
        title: Text("Flutter is Fun!"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey[300],

      body: Center(
        child: Container(
          width: 120,
          height: 120,
          color: Colors.blue,

          child: Column(
            children: [
              Text("Oii mae!!!", style: TextStyle(color: Colors.black)),
              SizedBox(height: 5),
              Icon(
                Icons.cyclone,
                color: Colors.yellow,
              ), //n achei o pintinho como icone ent deixou esse emoji
            ],
          ),
        ),
      ),
    );
  }
}
