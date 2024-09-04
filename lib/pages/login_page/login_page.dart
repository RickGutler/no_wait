import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_wait/components/app_bar_customizada.dart';
import 'package:no_wait/components/botao_principal.dart';
import 'package:no_wait/components/input_texto.dart';
import 'package:no_wait/pages/login_page/login_page_controller.dart';
import 'package:no_wait/style/app_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginPageController loginPageController = LoginPageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizada(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "Mesa 7",
                  style: AppFonts.headlineSmall,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputTexto(
                      controller: loginPageController.controllerNome,
                      hintText: "Nome",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nome não pode estar vazio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InputTexto(
                      controller: loginPageController.controllerCPF,
                      hintText: "CPF",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'CPF não pode estar vazio';
                        } else if (value.length < 11) {
                          return 'CPF necessita de 11 dígitos';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BotaoPrincipal(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginPageController.salvarUsuario().then(
                      (value) {
                        if (value) {
                          Navigator.pushNamed(context, '/menu');
                        }
                      },
                    );
                  }
                },
                texto: "Prosseguir",
                carregando: loginPageController.carregando,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
