import 'package:flutter/material.dart';
import 'package:no_wait/pages/landing_page/landing_page.dart';
import 'package:no_wait/pages/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Wait',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff7D1109)),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
      },
      initialRoute: '/',
    );
  }
}
