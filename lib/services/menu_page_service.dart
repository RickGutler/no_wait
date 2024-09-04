import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:no_wait/models/categoria.dart';

class MenuPageService extends ChangeNotifier {
  static final MenuPageService _instance = MenuPageService._internal();

  factory MenuPageService() {
    return _instance;
  }

  MenuPageService._internal();

  Future<List<Categoria>> buscarCategorias() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('categoria').get();

      final List<Categoria> categorias = snapshot.docs.map((doc) {
        return Categoria.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return categorias;
    } catch (e) {
      print('Erro ao buscar categorias: $e');
      return [];
    }
  }
}
