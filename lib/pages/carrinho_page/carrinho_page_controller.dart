import 'package:flutter/material.dart';
import 'package:no_wait/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarrinhoPageController extends ChangeNotifier {
  static final CarrinhoPageController _instance =
      CarrinhoPageController._internal();

  factory CarrinhoPageController() {
    return _instance;
  }

  CarrinhoPageController._internal();

  late Usuario usuario;
  ValueNotifier<bool> carregando = ValueNotifier(false);

  changeCarregando(bool value) {
    carregando.value = value;
    carregando.notifyListeners();
  }

  Future<bool> carregarUsuario() async {
    changeCarregando(true);
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String nome = preferences.getString("nome") ?? "";
    String cpf = preferences.getString("cpf") ?? "";
    usuario = Usuario(id: 1, nome: nome, cpf: cpf);
    changeCarregando(false);
    return true;
  }
}
