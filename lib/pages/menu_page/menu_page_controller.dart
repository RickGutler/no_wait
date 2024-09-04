import 'package:flutter/material.dart';
import 'package:no_wait/models/categoria.dart';
import 'package:no_wait/models/produto.dart';
import 'package:no_wait/services/menu_page_service.dart';

class MenuPageController extends ChangeNotifier {
  static final MenuPageController _instance = MenuPageController._internal();

  factory MenuPageController() {
    return _instance;
  }

  MenuPageController._internal();

  List<Categoria> categorias = [];
  ValueNotifier<bool> carregandoCategorias = ValueNotifier(false);

  List<Produto> produtos = [];
  ValueNotifier<bool> carregandoProdutos = ValueNotifier(false);

  changeCarregandoCategorias(bool value) {
    carregandoCategorias.value = value;
    carregandoCategorias.notifyListeners();
  }

  changeCarregandoProdutos(bool value) {
    carregandoProdutos.value = value;
    carregandoProdutos.notifyListeners();
  }

  Future<bool> carregarCategorias() async {
    MenuPageService service = MenuPageService();
    changeCarregandoCategorias(true);
    await Future.delayed(const Duration(milliseconds: 500));
    categorias = await service.buscarCategorias();
    changeCarregandoCategorias(false);
    return true;
  }

  Future<bool> carregarProdutos() async {
    MenuPageService service = MenuPageService();
    changeCarregandoProdutos(true);
    await Future.delayed(const Duration(milliseconds: 500));
    produtos = await service.buscarProdutos();
    print(produtos);
    changeCarregandoProdutos(false);
    return true;
  }
}
