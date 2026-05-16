import 'package:flutter/material.dart';

class Contador extends ChangeNotifier {
  int valorAtual = 0;

  int get valor => valorAtual;

  void incrementarValor() {
    valorAtual++;
    notifyListeners();
  }

  void decrementarValor() {
    valorAtual--;
    notifyListeners();
  }
}
