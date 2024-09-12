import 'package:flutter/material.dart';
import 'package:no_wait/carrinho_controller.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/components/card_item_pedido.dart';
import 'package:no_wait/pages/carrinho_page/carrinho_page_controller.dart';
import 'package:no_wait/style/app_colors.dart';
import 'package:no_wait/style/app_fonts.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.corPrincipal,
          size: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
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
            const Text(
              "Observações",
              style: AppFonts.titleSmall,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: controller.controllerObs,
                decoration: InputDecoration(
                  hintText: 'ex.: Retirar cebola',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Total",
                    style: AppFonts.titleSmall,
                  ),
                ),
                Text(
                    "R\$${controllerCarrinho.calcularSubtotal().toStringAsFixed(2)}")
              ],
            ),
            const Divider(
              color: AppColors.corPrincipal,
            ),
            const SizedBox(
              height: 16,
            ),
            BotaoPrincipal(
              onPressed: () async {
                bool resposta = await controller.enviarPedido(
                  controllerCarrinho.itensCarrinho.value,
                  controllerCarrinho.calcularSubtotal(),
                );

                if (resposta == true) {
                  controllerCarrinho.itensCarrinho.value = [];

                  Navigator.of(context).pop();
                }
              },
              texto: "Confirmar pedido",
            ),
          ],
        ),
      ),
    );
  }
}
