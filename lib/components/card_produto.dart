import 'package:flutter/material.dart';
import 'package:no_wait/carrinho_controller.dart';
import 'package:no_wait/models/produto.dart';
import 'package:no_wait/style/app_colors.dart';

class CardProduto extends StatefulWidget {
  final Produto produto;
  const CardProduto({super.key, required this.produto});

  @override
  State<CardProduto> createState() => _CardProdutoState();
}

class _CardProdutoState extends State<CardProduto> {
  int quantidade = 0;

  @override
  Widget build(BuildContext context) {
    CarrinhoController carrinhoController = CarrinhoController();

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
                      widget.produto.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'R\$${widget.produto.preco.toStringAsFixed(2).replaceAll(".", ",")}',
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
                    widget.produto.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.produto.descricao,
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
                GestureDetector(
                  onTap: () {
                    carrinhoController
                        .adicionarProdutoAoCarrinho(widget.produto);
                    setState(() {
                      quantidade++;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: const Center(
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                if (quantidade > 0)
                  GestureDetector(
                    onTap: () {
                      carrinhoController
                          .removerProdutoAoCarrinho(widget.produto);
                      setState(() {
                        quantidade--;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: const Center(
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardProdutoShimmer extends StatelessWidget {
  const CardProdutoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
    );
  }
}
