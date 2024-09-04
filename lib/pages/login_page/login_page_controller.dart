import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends ChangeNotifier {
  static final LoginPageController _instance = LoginPageController._internal();

  factory LoginPageController() {
    return _instance;
  }

  LoginPageController._internal();

  late SharedPreferences preferences;
  ValueNotifier<bool> carregando = ValueNotifier(false);
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCPF = TextEditingController();

  changeCarregando(bool value) {
    carregando.value = value;
    carregando.notifyListeners();
  }

  inicializarPreferences() async {
    try {
      preferences = await SharedPreferences.getInstance();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> salvarUsuario() async {
    changeCarregando(true);
    try {
      await inicializarPreferences();
      preferences.setString("nome", controllerNome.text);
      preferences.setString("cpf", controllerCPF.text);
      await Future.delayed(const Duration(milliseconds: 1000));
      changeCarregando(false);
      return true;
    } catch (e) {
      changeCarregando(false);
      return false;
    }
  }
}
