/*
ATIVIDADE 1. Crie um programa em Dart para um sistema de cadastro de equipamentos do IFSP. Use `var` para declarar o nome do equipamento como "Impressora 3D", `String` para o local como "Lab de Protótipos", e `dynamic` para o número de patrimônio, inicialmente como `12345`. Em seguida, altere o valor de `patrimonio` para `"12345-A"` (simulando uma mudança de formato). 

Por fim, imprima os valores e use o operador `is` para mostrar o tipo atual de cada variável. Use comentários no código para explicar por que Dart permite mudar o tipo de patrimonio, mas não de local

*/

void main() {
  var nomeDispositivo = "Impressora 3D";
  String local = "Lab de Protótipos";
  dynamic numPatrimonio = 12345;

  numPatrimonio = "12345-A";

  print(nomeDispositivo is String); //true
  print(local is String); //true
  print(numPatrimonio is String); //true
  print(numPatrimonio is int); //false

  /* O código permite alterar o tipo de valor armazenado do patrimonio pois é uma variável dinamyc, que significa que seu tipo não é algo fixo. Dependendo do valor armazenado, seu valor pode ser alterado.*/
}
