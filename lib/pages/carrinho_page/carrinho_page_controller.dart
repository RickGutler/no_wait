import 'package:flutter/material.dart';
import 'package:no_wait/models/itens_pedido.dart';
import 'package:no_wait/services/pedido_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarrinhoPageController extends ChangeNotifier {
  static final CarrinhoPageController _instance =
      CarrinhoPageController._internal();

  factory CarrinhoPageController() {
    return _instance;
  }

  CarrinhoPageController._internal();

  TextEditingController controllerObs = TextEditingController();
  ValueNotifier<bool> carregando = ValueNotifier(false);

  changeCarregando(bool value) {
    carregando.value = value;
    carregando.notifyListeners();
  }

  enviarPedido(List<ItensPedido> itensPedido, double subtotal) async {
    PedidoService pedidoService = PedidoService();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String nomeCliente = preferences.getString("nome") ?? "";
    String cpfCliente = preferences.getString("cpf") ?? "";

    bool resposta = await pedidoService.enviarPedido(
      itensPedido,
      controllerObs.text,
      subtotal,
      7,
      nomeCliente,
      cpfCliente,
    );

    return resposta;
  }
}
