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

import 'dart:io';

import 'House.dart';

void main() {
  int id;
  String? nome;
  double? preco;
  List<House> casas = [];

  for (int i = 1; i <= 3; i++) {
    print("Digite o id da ${i}° casa: ");
    id = int.parse(stdin.readLineSync()!);

    print("Digite o nome da ${i}° casa: ");
    nome = stdin.readLineSync();

    print("Digite o preço da ${i}° casa: ");
    preco = double.parse(stdin.readLineSync()!);

    if (nome != null && nome.isNotEmpty) {
      House novaCasa =
          House(id, nome, preco) //
            ..nome = "$nome (Cadastrada)";

      casas.add(novaCasa);
    }
  }

  print("--------- CASAS CADASTRADAS ---------");

  for (var casa in casas) {
    print(
      "ID: ${casa.id} | Nome: ${casa.nome} | Preço: ${casa.preco}",
    ); //tentei imprimir só 'casa' mas ele só retornava 'Instance of House'. Tenho q ver pq metodos nao funcionaram tbm, como casa.mostrarDetalhes
  }
  ;
}
