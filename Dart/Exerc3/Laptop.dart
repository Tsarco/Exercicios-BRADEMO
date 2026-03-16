/*

Escreva um programa em Dart para criar uma classe Laptop
com as propriedades [id, nome, ram, clockCpu] e crie 3 objetos dela,
imprimindo todos os detalhes

*/

class Laptop {
  dynamic id;
  String nome;
  String ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  void imprimirDetalhes() {
    print("\nNome: $nome");
    print("id: $id");
    print("ram: $ram");
    print("Clock CPU: $clockCpu");
  }
}
