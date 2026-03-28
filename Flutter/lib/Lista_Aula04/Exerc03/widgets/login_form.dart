import 'package:flutter/material.dart';
import '../model/login.dart';
import '../screens/home_screen.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Login _login = Login();

    return Column(
      children: [
        //usuario
        SizedBox(
          width: 250,
          child: TextField(
            onChanged: (value) => _login.email = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),

        SizedBox(height: 20),

        //senha
        SizedBox(
          width: 250,
          child: TextField(
            onChanged: (value) => _login.senha = value,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),

        SizedBox(height: 30),

        FloatingActionButton(
          onPressed: () {
            if (_login.auth()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Usuário ou Senha Incorreta")),
              );
            }
          },

          child: Text("Fazer Login"),
        ),
      ],
    );
  }
}
