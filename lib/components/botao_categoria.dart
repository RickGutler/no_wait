import 'package:flutter/material.dart';
import 'package:no_wait/models/categoria.dart';
import 'package:no_wait/style/app_colors.dart';
import 'package:no_wait/style/app_fonts.dart';
import 'package:shimmer/shimmer.dart';

class BotaoCategoria extends StatelessWidget {
  final Categoria categoria;
  const BotaoCategoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: AppColors.corPrincipal,
                borderRadius: BorderRadiusDirectional.circular(12)),
            child: Image.network(categoria.img),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 80,
            child: Text(
              categoria.nome,
              textAlign: TextAlign.center,
              style: AppFonts.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}

class BotaoCategoriaShimmer extends StatelessWidget {
  const BotaoCategoriaShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: AppColors.corPrincipal,
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 80,
              child: Container(
                height: 14,
                width: 50,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
