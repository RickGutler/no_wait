import 'package:flutter/material.dart';
import 'package:no_wait/components/app_bar_customizada.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustomizada(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text('Mesa 7'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
