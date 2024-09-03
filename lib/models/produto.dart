class Produto {
  final int id;
  final double preco;
  final String nome;
  final String descricao;
  final String img;
  final int idCategoria;

  Produto({
    required this.id,
    required this.preco,
    required this.nome,
    required this.descricao,
    required this.img,
    required this.idCategoria,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      preco: json['preco'].toDouble(),
      nome: json['nome'],
      descricao: json['descricao'],
      img: json['img'],
      idCategoria: json['id_categoria'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'preco': preco,
      'nome': nome,
      'descricao': descricao,
      'img': img,
      'id_categoria': idCategoria,
    };
  }
}
