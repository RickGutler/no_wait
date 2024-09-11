import 'package:flutter/material.dart';

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
}
