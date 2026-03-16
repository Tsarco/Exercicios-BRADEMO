/*
ATIVIDADE 2. Crie um programa em Dart que simule o cadastro de um funcionário em uma
empresa. Para compor o programa, crie a função cadastrarFuncionario que deve
receber dois parâmetros nomeados: String nome (obrigatório) e String? cargo
(opcional). Imprima uma mensagem de boas-vindas, incluindo o cargo apenas se ele for
informado.
 */

import 'dart:io';

cadastrarFuncionario({required String nome, String? cargo}) {
  print("Seja bem vindo ${nome!} para a empresa!");

  //isNotEmpty pra checar caso o user colocar enter, ja que 'enter' != null.
  if (cargo != null && cargo.isNotEmpty) {
    print("Seu cargo atual é: ${cargo}.");
  }
}

void main() {
  print("Digite seu nome: ");
  String? nome = stdin.readLineSync();
  //teoricamente vc checaria na função pra ver se o usuário digitou e entraria num loop caso não, mas por questão de simplicidade só estamos lendo msm.

  print("Digite seu cargo caso houver:");
  String? cargo = stdin.readLineSync();

  if (nome != null) {
    cadastrarFuncionario(nome: nome, cargo: cargo);
  } else {
    print("Seu nome não pode ser nulo.");
  }
}
