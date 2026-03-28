class Login {
  String email = '';
  String senha = '';

  bool auth() => email == 'admin' && senha == '1234';
}
