/*

Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes

*/

class Laptop {
  dynamic id;
  String nome = '';
  String ram = '';
  double clockCpu = 12;

  Laptop.build(dynamic id, String nome, String ram, double clockCpu) {
    this.id = id;
    this.nome = nome;
    this.ram = ram;
    this.clockCpu = clockCpu;
  }

  void imprimirDetalhes() {
    print("\nNome: $nome");
    print("id: $id");
    print("ram: $ram");
    print("Clock CPU: $clockCpu");
  }
}
