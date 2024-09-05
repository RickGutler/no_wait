import 'package:flutter/material.dart';
import 'package:no_wait/models/itens_pedido.dart';
import 'package:no_wait/models/produto.dart';

class CarrinhoController extends ChangeNotifier {
  static final CarrinhoController _instance = CarrinhoController._internal();

  factory CarrinhoController() {
    return _instance;
  }

  CarrinhoController._internal();

  ValueNotifier<List<ItensPedido>> itensCarrinho =
      ValueNotifier<List<ItensPedido>>([]);

  void adicionarProdutoAoCarrinho(Produto produto) {
    final index =
        itensCarrinho.value.indexWhere((item) => item.produto.id == produto.id);

    if (index != -1) {
      itensCarrinho.value[index].quantidade++;
    } else {
      itensCarrinho.value.add(ItensPedido(produto: produto, quantidade: 1));
    }
    itensCarrinho.notifyListeners();
  }

  void removerProdutoAoCarrinho(Produto produto) {
    final index =
        itensCarrinho.value.indexWhere((item) => item.produto.id == produto.id);

    if (index != -1) {
      if (itensCarrinho.value[index].quantidade > 1) {
        itensCarrinho.value[index].quantidade--;
      } else {
        itensCarrinho.value.removeAt(index);
      }
    }
    itensCarrinho.notifyListeners();
  }

  int qtdItensCarrinhoTotal() {
    return itensCarrinho.value
        .fold(0, (total, item) => total + item.quantidade);
  }

  int qtdItensCarrinhoProduto(Produto produto) {
    return itensCarrinho.value.fold(
        0,
        (total, item) =>
            total + item.produto.id == produto.id ? item.quantidade : 0);
  }
}
