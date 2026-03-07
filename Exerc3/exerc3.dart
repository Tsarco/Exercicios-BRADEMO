/*

Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes

*/

import 'dart:io';
import 'Laptop.dart';

void main() {
  Laptop laptop = Laptop.build(01, "Stardew Valley", "16GB", 1.4);

  laptop.imprimirDetalhes();
}
