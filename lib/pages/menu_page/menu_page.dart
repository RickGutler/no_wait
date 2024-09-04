import 'package:flutter/material.dart';
import 'package:no_wait/components/app_bar_customizada_menu.dart';
import 'package:no_wait/components/botao_categoria.dart';
import 'package:no_wait/pages/menu_page/menu_page_controller.dart';
import 'package:no_wait/style/app_colors.dart';
import 'package:no_wait/style/app_fonts.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizadaMenu(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
                              categoria: controller.categorias[index]);
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
                })
          ],
        ),
      ),
    );
  }
}
