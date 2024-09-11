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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(8),
                child: Image.network(
                  itemPedido.produto.img,
                  fit: BoxFit.cover,
                ),
              ),
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
                      color: AppColors.corPrincipal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'R\$${itemPedido.produto.preco.toStringAsFixed(2).replaceAll(".", ",")}',
                    style: const TextStyle(
                      color: AppColors.corPrincipal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.corPrincipal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    itemPedido.quantidade.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
