import 'package:flutter/material.dart';
import 'package:no_wait/style/app_colors.dart';

class BotaoPrincipal extends StatelessWidget {
  final String texto;
  final Function onPressed;
  final ValueNotifier<bool>? carregando;

  const BotaoPrincipal({
    super.key,
    required this.onPressed,
    required this.texto,
    this.carregando,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: carregando ?? ValueNotifier(false),
      builder: (context, loading, child) {
        return GestureDetector(
          onTap: () => loading ? () {} : onPressed(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.corPrincipal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
              child: loading
                  ? const SizedBox(
                      height: 26,
                      width: 26,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      texto,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
