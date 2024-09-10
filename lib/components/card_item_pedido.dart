import 'package:flutter/material.dart';
import 'package:no_wait/models/itens_pedido.dart';
import 'package:no_wait/style/app_colors.dart';

class CardItemPedido extends StatelessWidget {
  final ItensPedido itemPedido;
  const CardItemPedido({super.key, required this.itemPedido});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: AppColors.corPrincipal,
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    child: Image.network(
                      itemPedido.produto.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'R\$${itemPedido.produto.preco.toStringAsFixed(2).replaceAll(".", ",")}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              // Use Expanded para o conteúdo de texto ocupar o espaço disponível
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemPedido.produto.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    itemPedido.produto.descricao,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemPedido.quantidade.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
