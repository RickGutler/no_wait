import 'package:flutter/material.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/pages/landing_page/landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LandingPageController controller = LandingPageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.png"),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BotaoPrincipal(
                    onPressed: () {
                      controller.iniciar().then((iniciouComSucesso) {
                        if (iniciouComSucesso) {
                          Navigator.pushNamed(context, '/login');
                        }
                      });
                    },
                    texto: "Iniciar",
                    carregando: controller.carregando,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
