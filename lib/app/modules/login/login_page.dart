import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_flutter/app/core/constantes/constantes.dart';
import 'package:prova_flutter/app/core/ui/widgets/default_text_form_field.dart';
import 'package:prova_flutter/app/core/ui/widgets/privacy_policy.dart';
import 'package:prova_flutter/app/modules/input_text/input_text_page.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const nameRoute = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade700,
              Colors.teal,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              _LoginForm(),
              Spacer(),
              PrivacyPolicy(),
            ],
          ),
        ),
      ),
    );
  }
}
