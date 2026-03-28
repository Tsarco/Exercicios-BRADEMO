import 'package:flutter/material.dart';
import 'package:flutter_ex1/Lista_Aula04/Exerc03/model/login.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.yellow),

      child: Scaffold(
        appBar: AppBar(title: Text("Exerc03 com Theme Data")),

        body: Center(
          child: Column(
            children: [
              Row(children: [Image.asset('imagens/lake.png'), Text('Flutter')]),
              SizedBox(height: 20),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
