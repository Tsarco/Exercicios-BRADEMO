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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Column(
                children: [
                  Icon(Icons.phone, color: Colors.purple, size: 50),
                  Text("Call", style: TextStyle(color: Colors.purple)),
                ],
              ),

              Column(
                children: [
                  Icon(Icons.send, color: Colors.purple, size: 50),
                  Text("Route", style: TextStyle(color: Colors.purple)),
                ],
              ),

              Column(
                children: [
                  Icon(Icons.share, color: Colors.purple, size: 50),
                  Text("Share", style: TextStyle(color: Colors.purple)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
