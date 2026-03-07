/*

ATIVIDADE 4. Utilizando a classe Laptop do exercício anterior, crie 3 named
constructors. Cada um deve criar uma instância de Laptop que configure:
• um laptop para somente navegação na internet;
• um laptop para uso em escritório;
• um laptop para programação.
Você deve decidir quais configurações serão definidas em cada named
constructor. Por fim, crie instâncias de objetos Laptop utilizando cada um dos
named constructor e imprima seus valores no console.

*/

import 'dart:io';
import 'Laptop.dart';

void main() {
  Laptop laptop1 = Laptop.internet();
  Laptop laptop2 = Laptop.trabalho();
  Laptop laptop3 = Laptop.programador();

  laptop1.imprimirDetalhes();
  laptop2.imprimirDetalhes();
  laptop3.imprimirDetalhes();
}
