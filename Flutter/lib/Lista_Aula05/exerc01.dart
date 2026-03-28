import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          Image.network(
            "https://i.redd.it/rptm69fxzmmg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/r8jccv9tw6qg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/rptm69fxzmmg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/r8jccv9tw6qg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/rptm69fxzmmg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/r8jccv9tw6qg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/rptm69fxzmmg1.png",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.redd.it/r8jccv9tw6qg1.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
