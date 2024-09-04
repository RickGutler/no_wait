class Categoria {
  final int id;
  final String nome;
  final String img;

  Categoria({
    required this.id,
    required this.nome,
    required this.img,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nome: json['nome'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'img': img,
    };
  }
}
