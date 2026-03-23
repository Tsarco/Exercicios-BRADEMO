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
          "FittedBox e SizedBox",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20), //sizedbox vazio pra dar espaçamento?

              SizedBox(
                height: 150,
                width: 100,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    "https://png.pngtree.com/thumb_back/fh260/background/20210115/pngtree-graphic-design-advertising-gradient-picture-cool-background-image_529818.jpg",
                  ),
                ),
              ),

              SizedBox(height: 20), //sizedbox vazio pra dar espaçamento?

              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  'https://png.pngtree.com/thumb_back/fh260/background/20210115/pngtree-graphic-design-advertising-gradient-picture-cool-background-image_529818.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
