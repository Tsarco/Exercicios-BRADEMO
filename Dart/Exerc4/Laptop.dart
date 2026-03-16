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

class Laptop {
  int id;
  String nome;
  String ram;
  double clockCpu;

  Laptop.internet()
    : // os : -> inicializam os objetos abaixo antes das linhas de cima, assim n causa erro por n ter inicializado.
      id = 1,
      nome = 'Internet',
      ram = '32GB',
      clockCpu = 1.0;

  Laptop.trabalho() : id = 2, nome = 'Trabalho', ram = '16GB', clockCpu = 2.0;

  Laptop.programador()
    : id = 3,
      nome = 'Programador',
      ram = '32GB',
      clockCpu = 3.0;

  void imprimirDetalhes() {
    print("\nNome: $nome");
    print("id: $id");
    print("ram: $ram");
    print("Clock CPU: ${clockCpu}Ghz");
  }
}
