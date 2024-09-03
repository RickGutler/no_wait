class Usuario {
  final int id;
  final String nome;
  final String cpf;

  Usuario({required this.id, required this.nome, required this.cpf});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
    };
  }
}
