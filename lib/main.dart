import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:no_wait/firebase_options.dart';
import 'package:no_wait/pages/landing_page/landing_page.dart';
import 'package:no_wait/pages/login_page/login_page.dart';
import 'package:no_wait/pages/menu_page/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        '/login': (context) => LoginPage(),
        '/menu': (context) => const MenuPage(),
      },
      initialRoute: '/',
    );
  }
}
