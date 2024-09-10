import 'package:flutter/material.dart';
import 'package:no_wait/carrinho_controller.dart';
import 'package:no_wait/components/app_bar_customizada_menu.dart';
import 'package:no_wait/components/botao_categoria.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/components/card_produto.dart';
import 'package:no_wait/models/produto.dart';
import 'package:no_wait/pages/menu_page/menu_page_controller.dart';
import 'package:no_wait/style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuPageController controller = MenuPageController();
  CarrinhoController carrinhoController = CarrinhoController();
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _categoriaKeys = {};

  @override
  void initState() {
    super.initState();
    controller.carregarCategorias();
    controller.carregarProdutos();
  }

  void _scrollToCategoria(int categoriaId) {
    final categoriaKey = _categoriaKeys[categoriaId];
    if (categoriaKey != null) {
      final context = categoriaKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
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
              controller: _scrollController,
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
                            final categoria = controller.categorias[index];
                            return GestureDetector(
                              onTap: () => _scrollToCategoria(categoria.id),
                              child: BotaoCategoria(
                                categoria: categoria,
                              ),
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
                          _categoriaKeys[categoria.id] =
                              GlobalKey(); // Adicionar chave global para a categoria

                          List<Produto> produtosFiltrados = controller.produtos
                              .where((p) => p.idCategoria == categoria.id)
                              .toList();

                          if (produtosFiltrados.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Column(
                            key: _categoriaKeys[
                                categoria.id], // Associar chave à categoria
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: SizedBox(
                            width: 100,
                            child: Container(
                              height: 20,
                              width: 70,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: const CardProdutoShimmer(),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BotaoPrincipal(
                        onPressed: () {
                          if (carrinhoController.qtdItensCarrinhoTotal() > 0) {
                            Navigator.pushNamed(context, '/carrinho');
                          }
                        },
                        texto: 'Ver Pedido',
                        suffix: const QuantidadeItensPedido(),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class QuantidadeItensPedido extends StatelessWidget {
  const QuantidadeItensPedido({super.key});

  @override
  Widget build(BuildContext context) {
    CarrinhoController controller = CarrinhoController();

    return ValueListenableBuilder(
        valueListenable: controller.itensCarrinho,
        builder: (context, itens, _) {
          if (itens.isNotEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(15)),
                  child: Center(
                    child: Text(
                      controller.qtdItensCarrinhoTotal().toString(),
                      style: const TextStyle(
                          color: AppColors.corPrincipal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        });
  }
}
