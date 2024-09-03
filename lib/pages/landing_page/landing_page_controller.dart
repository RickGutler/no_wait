import 'package:flutter/material.dart';

class LandingPageController extends ChangeNotifier {
  static final LandingPageController _instance =
      LandingPageController._internal();

  factory LandingPageController() {
    return _instance;
  }

  LandingPageController._internal();

  ValueNotifier<bool> carregando = ValueNotifier(false);

  changeCarregando(bool value) {
    carregando.value = value;
    carregando.notifyListeners();
  }

  Future<bool> iniciar() async {
    //Tempo para simular a lógica para buscar o que tiver que buscar, por exemplo o número da mesa
    changeCarregando(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    changeCarregando(false);
    return true;
  }
}
