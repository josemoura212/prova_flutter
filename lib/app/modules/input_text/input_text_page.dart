import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/widgets/privacy_policy.dart';
import 'package:prova_flutter/app/modules/input_text/input_text_controller.dart';
import 'package:validatorless/validatorless.dart';
import "package:flutter_mobx/flutter_mobx.dart";

class InputTextPage extends StatefulWidget {
  const InputTextPage({super.key});

  static const nameRoute = "/input-text";

  @override
  State<InputTextPage> createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {
  final contoller = InputTextController();
  final _textEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final textFN = FocusNode();

  @override
  void initState() {
    super.initState();
    contoller.getInputText();
    textFN.requestFocus();
  }

  @override
  void dispose() {
    _textEC.dispose();
    textFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          reverse: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: DecoratedBox(
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
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Card(
                          child: SizedBox(
                            height: size.height * .5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextFormField(),
                                  Observer(builder: (_) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: contoller.inputText.length,
                                      itemBuilder: (context, index) {
                                        return Text(contoller.inputText[index]);
                                      },
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          focusNode: textFN,
                          controller: _textEC,
                          onFieldSubmitted: _onSubmit,
                          validator:
                              Validatorless.required("Campo obrigatório"),
                          decoration: InputDecoration(
                            label: const Text("Digite seu texto"),
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const PrivacyPolicy(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _onSubmit(String value) {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      contoller.saveInputText(value);
      _textEC.clear();
    } else {
      textFN.requestFocus();
    }
  }
}
