import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Raiz da árvore de widgets
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaTarefas(),
    );
  }
}

class TelaTarefas extends StatefulWidget {
  @override
  _TelaTarefasState createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  List<bool> _tarefasConcluidas = List.generate(5, (index) => false);

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text("Você está no App de Notas de Tarefas"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kindacode.com"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Ver Tarefas Concluidas"),
            ),

            SizedBox(height: 20),

            Text("5 Tarefas n concluidas", style: TextStyle(fontSize: 16)),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber[300],
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        "Task 2022-07-09\n18:08:31",
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Checkbox(
                        value: _tarefasConcluidas[index],
                        onChanged: (bool? valor) {
                          setState(() {
                            _tarefasConcluidas[index] = valor ?? false;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // FloatingActionButton requisitado
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarAlerta(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
