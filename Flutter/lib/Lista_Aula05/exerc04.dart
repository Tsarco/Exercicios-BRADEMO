import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário")),
      body: Center(child: Formulario()),
    );
  }
}

// Widget custom do form
class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

// Classe state com os dados do form
class _FormularioState extends State<Formulario> {
  // Controller pra pegar dados do TextField
  final meuControllerNome = TextEditingController();
  final meuControllerFone = TextEditingController();
  final meuControllerNascimento = TextEditingController();

  @override
  void dispose() {
    // Soltar controller dps de usar
    meuControllerNome.dispose();
    meuControllerFone.dispose();
    meuControllerNascimento.dispose();
    super.dispose();
  }

  void _mostrarInputSnackBar() {
    final String text =
        "Olá, ${meuControllerNome.text}, seu telefone é ${meuControllerFone.text} e você nasceu em ${meuControllerNascimento.text}!";

    // Exibe o texto na SnackBar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: meuControllerNome,
                    decoration: InputDecoration(labelText: "Nome"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: meuControllerFone,
                    decoration: InputDecoration(labelText: "Telefone"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: meuControllerNascimento,
                    decoration: InputDecoration(labelText: "Nascimento"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _mostrarInputSnackBar,
              child: const Text("Mostrar Dados"),
            ),
          ],
        ),
      ),
    );
  }
}
