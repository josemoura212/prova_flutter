import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/ui_config.dart';
import 'package:prova_flutter/app/modules/input_text/input_text_page.dart';
import 'package:prova_flutter/app/modules/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      title: UiConfig.tittle,
      initialRoute: "/login",
      routes: {
        LoginPage.nameRoute: (context) => const LoginPage(),
        InputTextPage.nameRoute: (context) => const InputTextPage(),
      },
    );
  }
}
