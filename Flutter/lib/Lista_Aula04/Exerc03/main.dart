import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 3 - Login',
      theme: ThemeData(
        primaryColor: Colors.blue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Você pode adicionar o inputDecorationTheme aqui se quiser padronizar os campos
      ),
      home: LoginScreen(),
    );
  }
}
