import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/widgets/default_text_form_field.dart';
import 'package:prova_flutter/app/core/ui/widgets/privacy_policy.dart';
import 'package:prova_flutter/app/modules/input_text/input_text_controller.dart';
import 'package:validatorless/validatorless.dart';
import "package:flutter_mobx/flutter_mobx.dart";
part 'widgets/input_text_item.dart';

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

  int? editingIndex;
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
                    colors: [Colors.blue.shade700, Colors.teal],
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                children: [
                                  Observer(
                                    builder: (_) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: contoller.inputText.length,
                                        itemBuilder: (context, index) {
                                          final text =
                                              contoller.inputText[index];
                                          // return Text(contoller.inputText[index]);
                                          return InputTextItem(
                                              label: text,
                                              editInuptText: () =>
                                                  _editInuptText(index),
                                              deleteInuptText: () =>
                                                  _deleteInuptText(index));
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        DefaultTextFormField(
                          focusNode: textFN,
                          controller: _textEC,
                          onFieldSubmitted: _onSubmit,
                          labelText: "Digite seu texto",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          validator:
                              Validatorless.required("Campo obrigatório"),
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

  void _onSubmit(
    String text,
  ) {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      contoller.saveInputText(text, editingIndex);
      _textEC.clear();
    } else {
      textFN.requestFocus();
    }
    editingIndex = null;
  }

  void _editInuptText(int index) {
    editingIndex = index;
    textFN.requestFocus();
    _textEC.text = contoller.inputText[index];
  }

  void _deleteInuptText(int index) async {
    final confirm = await showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          title: const Text("Deseja deletar?"),
          content: const Text("Realmente deseja deletar o texto?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Confirmar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancelar!"),
            ),
          ],
        );
      },
    );
    if (confirm) {
      contoller.deleteInputText(index);
    }
  }
}
