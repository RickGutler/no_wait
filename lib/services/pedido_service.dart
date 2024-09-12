import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:no_wait/models/itens_pedido.dart';

class PedidoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> enviarPedido(
      List<ItensPedido> itens,
      String observacao,
      double total,
      int numeroMesa,
      String nomeCliente,
      String cpfCliente) async {
    try {
      // Adiciona o pedido com nome e CPF do cliente
      DocumentReference pedidoRef = await _firestore.collection('pedidos').add({
        'observacao': observacao,
        'total': total,
        'numeroMesa': numeroMesa,
        'data': Timestamp.now(),
        'status': 'pendente', // Status inicial do pedido
        'nomeCliente': nomeCliente, // Nome do cliente
        'cpfCliente': cpfCliente, // CPF do cliente
      });

      // Adiciona os itens do pedido
      for (var item in itens) {
        await pedidoRef.collection('itens').add({
          'produtoId': item.produto.id,
          'nomeProduto': item.produto.nome,
          'quantidade': item.quantidade,
          'preco': item.produto.preco,
          'subtotal': item.quantidade * item.produto.preco,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
