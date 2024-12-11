// model/cadastro_model.dart

class CadastroModel {
  String nome;
  String email;
  String phone; // Campo para telefone
  String password; // Campo para senha

  CadastroModel({
    required this.nome,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}