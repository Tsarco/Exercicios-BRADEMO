import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

class TarefaProvider extends ChangeNotifier {
  List<String> listaTarefas = [];
  late Box box;

  TarefaProvider() {
    box = Hive.box('tarefasBox');

    // converte dados q existem pra string
    final dadosSalvos = box.get('lista');
    if (dadosSalvos != null) {
      listaTarefas = List<String>.from(dadosSalvos);
    }
  }

  //getter
  List<String> get tarefas => listaTarefas;

  void adicionar(String tarefa) {
    if (tarefa.trim().isEmpty) return; //só checa se n é uma tarefa vazia

    listaTarefas.add(tarefa);
    _atualizarBanco();
  }

  void remover(int index) {
    listaTarefas.removeAt(index);
    _atualizarBanco();
  }

  // salva no hive e faz o notify
  void _atualizarBanco() {
    box.put('lista', listaTarefas);
    notifyListeners();
  }
}
