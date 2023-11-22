import 'package:flutter/material.dart';

class InputTextPage extends StatelessWidget {
  const InputTextPage({Key? key}) : super(key: key);

  static const nameRoute = "/input-text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Text'),
      ),
      body: Container(),
    );
  }
}
