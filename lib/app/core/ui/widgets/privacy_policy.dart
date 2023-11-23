import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextButton(
      onPressed: _laucherUrl,
      child: Text(
        "Politica de privacidade",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Future<void> _laucherUrl() async {
  if (!await launchUrl(Uri.parse("https://www.google.com.br/"))) {
    throw Exception("Erro ao abrir URL");
  }
}
