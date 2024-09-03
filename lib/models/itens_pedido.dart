class ItensPedido {
  final int idPedido;
  final int idProduto;
  final int quantidade;
  final double subtotal;

  ItensPedido({
    required this.idPedido,
    required this.idProduto,
    required this.quantidade,
    required this.subtotal,
  });

  factory ItensPedido.fromJson(Map<String, dynamic> json) {
    return ItensPedido(
      idPedido: json['id_pedido'],
      idProduto: json['id_produto'],
      quantidade: json['quantidade'],
      subtotal: json['subtotal'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_pedido': idPedido,
      'id_produto': idProduto,
      'quantidade': quantidade,
      'subtotal': subtotal,
    };
  }
}
