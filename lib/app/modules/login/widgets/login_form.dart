part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            label: "Usuário",
            controller: _loginEC,
            icon: Icons.person,
            textInputAction: TextInputAction.next,
            validator: Validatorless.multiple([
              Validatorless.min(2, "Minimo de 2 caracteres"),
              Validatorless.max(20, "Maximo de 20 caracteres"),
              Validatorless.required("Campo obrigatório"),
              Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'),
                  "Campo não pode ter caracteres especiais"),
            ]),
          ),
          const SizedBox(height: 20),
          DefaultTextFormField(
            label: "Senha",
            controller: _passwordEC,
            icon: Icons.lock,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (_) => _onSubmit(),
            validator: Validatorless.multiple([
              Validatorless.min(2, "Minimo de 2 caracteres"),
              Validatorless.max(20, "Maximo de 20 caracteres"),
              Validatorless.required("Campo obrigatório"),
              Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'),
                  "Campo não pode ter caracteres especiais"),
            ]),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(size.width * .6, 60),
              backgroundColor: Colors.greenAccent.shade400,
            ),
            onPressed: _onSubmit,
            child: const Text(
              "Entrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      final url = Uri.parse(Constantes.url);
      post(
        url,
        body: {
          "login": _loginEC.text,
          "password": _passwordEC.text,
        },
      );
      Navigator.pushNamedAndRemoveUntil(
          context, InputTextPage.nameRoute, (route) => false);
    }
  }
}
