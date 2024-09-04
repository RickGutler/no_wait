import 'package:flutter/material.dart';
import 'package:no_wait/components/app_bar_customizada_menu.dart';
import 'package:no_wait/components/botao_categoria.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/components/card_produto.dart';
import 'package:no_wait/models/produto.dart';
import 'package:no_wait/pages/menu_page/menu_page_controller.dart';
import 'package:no_wait/style/app_colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuPageController controller = MenuPageController();

  @override
  void initState() {
    super.initState();
    controller.carregarCategorias();
    controller.carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizadaMenu(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            child: ListView(
              children: [
                ValueListenableBuilder(
                  valueListenable: controller.carregandoCategorias,
                  builder: (context, carregando, _) {
                    if (!carregando) {
                      return SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categorias.length,
                          itemBuilder: (context, index) {
                            return BotaoCategoria(
                              categoria: controller.categorias[index],
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox(
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const BotaoCategoriaShimmer();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                ValueListenableBuilder(
                  valueListenable: controller.carregandoProdutos,
                  builder: (context, carregando, child) {
                    if (!carregando) {
                      return Column(
                        children: controller.categorias.map((categoria) {
                          List<Produto> produtosFiltrados = controller.produtos
                              .where((p) => p.idCategoria == categoria.id)
                              .toList();

                          if (produtosFiltrados.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categoria.nome,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.corPrincipal),
                              ),
                              const SizedBox(height: 12),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: produtosFiltrados.length,
                                itemBuilder: (context, index) {
                                  return CardProduto(
                                    produto: produtosFiltrados[index],
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return const Center(child: Text('Carregando...'));
                  },
                ),
              ],
            ),
          ),
          Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotaoPrincipal(onPressed: () {}, texto: 'Ver Pedido'),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
