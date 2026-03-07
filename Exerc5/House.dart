/*
ATIVIDADE 5. Escreva um programa de cadastro de residências em um portal
de vendas em Dart. Para tal, siga as instruções a seguir:

• Crie uma classe House com as propriedades int id, String name e double
price;
• Implemente um construtor que utilize o this para inicializar os atributos.
• Solicite ao usuário que digite os dados (id, name e price) de 3 casas;
• Crie os objetos da classe com os dados informados e adicione-os a uma
lista;
• Após a criação, use cascade notation (..) para alterar o nome de cada
casa, adicionando o sufixo "(Cadastrada)".
• Use um for-in para imprimir todos os detalhes das casas cadastradas.
Dica: Use stdin.readLineSync() e lembre-se de converter os dados com
int.parse() e double.parse()

 */

class House {
  int id;
  String nome;
  double preco;

  House(this.id, this.nome, this.preco);

  void mostrarDetalhes() {
    print("ID: $id | Nome: $nome | preço: $preco");
  }
}
