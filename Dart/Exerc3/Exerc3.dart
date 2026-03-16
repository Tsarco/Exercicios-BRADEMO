/*

Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes

*/

import 'dart:io';
import 'Laptop.dart';

void main() {
  Laptop laptop1 = Laptop(01, "Penny", "8GB", 1.4);
  Laptop laptop2 = Laptop(01, "Abigail", "32GB", 1.1);
  Laptop laptop3 = Laptop(01, "Sebastian", "64GB", 1.3);

  laptop1.imprimirDetalhes();
  laptop2.imprimirDetalhes();
  laptop3.imprimirDetalhes();
}
