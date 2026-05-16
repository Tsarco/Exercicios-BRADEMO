import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'TarefaProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tarefasBox');

  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider(),
      child: const MaterialApp(home: TelaPrincipal()),
    ),
  );
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Consumer<TarefaProvider>(
          builder: (context, tarefaCache, _) {
            return Column(
              children: [
                //lugar onde vc inseri a tarefa
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Adicione sua tarefa aqui',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          tarefaCache.adicionar(_controller.text);
                          _controller.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                        ),
                        child: const Text("Adicionar"),
                      ),
                    ],
                  ),
                ),

                //lista de tarefas
                Expanded(
                  child: ListView.builder(
                    itemCount: tarefaCache
                        .tarefas
                        .length, //tamanho da lista é igual o tamanho da lista do hive
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          tarefaCache
                              .tarefas[index], //pega item da lista de acordo com index
                          style: const TextStyle(
                            color: Color.fromARGB(255, 170, 10, 37),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () => tarefaCache.remover(index),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
