class Pedido {
  final int id;
  final int idUsuario;
  final DateTime data;
  final double total;
  final int idStatus;
  final int numeroMesa;

  Pedido({
    required this.id,
    required this.idUsuario,
    required this.data,
    required this.total,
    required this.idStatus,
    required this.numeroMesa,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      idUsuario: json['id_usuario'],
      data: DateTime.parse(json['data']),
      total: json['total'].toDouble(),
      idStatus: json['id_status'],
      numeroMesa: json['numeroMesa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_usuario': idUsuario,
      'data': data.toIso8601String(),
      'total': total,
      'id_status': idStatus,
      'numeroMesa': numeroMesa,
    };
  }
}
