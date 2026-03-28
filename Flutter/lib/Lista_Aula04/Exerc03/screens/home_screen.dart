import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.white),

      child: Scaffold(
        appBar: AppBar(title: Text("Home")),

        body: Center(
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2-TVphB148wg1omRxgqXTMk9lDbLyunCmdw&s",
          ),
        ),
      ),
    );
  }
}
