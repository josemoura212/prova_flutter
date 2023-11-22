import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/widgets/default_text_form_field.dart';
import 'package:prova_flutter/app/modules/input_text/input_text_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/privacy_policy.dart';
part 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const nameRoute = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              _LoginForm(),
              Spacer(),
              _PrivacyPolicy(),
            ],
          ),
        ),
      ),
    );
  }
}
