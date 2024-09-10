import 'package:flutter/material.dart';
import 'package:no_wait/carrinho_controller.dart';
import 'package:no_wait/components/app_bar_customizada_menu.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/components/card_item_pedido.dart';
import 'package:no_wait/pages/carrinho_page/carrinho_page_controller.dart';
import 'package:no_wait/style/app_colors.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  CarrinhoPageController controller = CarrinhoPageController();
  CarrinhoController controllerCarrinho = CarrinhoController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.carregarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizadaMenu(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: AppColors.corPrincipal,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Voltar para o menu",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.corPrincipal),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                "Carrinho de ${controller.usuario.nome}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.corPrincipal),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controllerCarrinho.itensCarrinho,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return CardItemPedido(itemPedido: value[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            BotaoPrincipal(
              onPressed: () {
                print("enviarpedido");
              },
              texto:
                  "Enviar pedido: Total R\$${controllerCarrinho.calcularSubtotal().toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
