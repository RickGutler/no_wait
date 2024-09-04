import 'package:flutter/material.dart';
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
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(paddingTop + 50),
          child: SizedBox(
            height: paddingTop + 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: paddingTop),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                      height: 25, child: Image.asset("assets/logo.png")),
                ),
              ],
            ),
          )),
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
