import 'package:no_wait/models/produto.dart';

class ItensPedido {
  final Produto produto;
  int quantidade;

  ItensPedido({
    required this.produto,
    required this.quantidade,
  });

  factory ItensPedido.fromJson(Map<String, dynamic> json) {
    return ItensPedido(
      produto: Produto.fromJson(json['produto']),
      quantidade: json['quantidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_produto': produto.id,
      'quantidade': quantidade,
      'subtotal': calcularSubTotal(),
    };
  }

  double calcularSubTotal() {
    return produto.preco * quantidade;
  }
}
