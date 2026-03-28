import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 3 - Login',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          extendedTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            inherit: true,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
