import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesa_news/core/masks.dart';
import 'package:mesa_news/core/validators.dart';
import 'package:mesa_news/modules/login_module/blocs/login_bloc.dart';
import 'package:mesa_news/modules/login_module/blocs/login_bloc_events.dart';
import 'package:mesa_news/shared/widgets/generic_button_widget.dart';
import 'package:mesa_news/shared/widgets/generic_input_widget.dart';
import 'package:mesa_news/shared/widgets/solid_app_bar_widget.dart';

class LoginSignUpPage extends StatelessWidget {

  LoginSignUpPage({this.bloc});

  final LoginBloc bloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Widget separator = SizedBox(height: 26);

    return Scaffold(
      appBar: SolidAppBar(
        title: 'Cadastrar',
        onCancel: () => Navigator.of(context).pop(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: <Widget>[
            GenericInput(
              title: 'Nome',
              controller: _nameController,
              textInputAction: TextInputAction.next,
            ),
            separator,
            GenericInput(
              title: 'E-mail',
              controller: _emailController,
              textInputAction: TextInputAction.next,
              validator: Validators.emailValidator,
            ),
            separator,
            GenericInput(
              title: 'Senha',
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              obscure: true,
              validator: Validators.passwordValidator,
            ),
            separator,
            GenericInput(
              title: 'Confirmar senha',
              controller: _repeatPasswordController,
              textInputAction: TextInputAction.next,
              obscure: true,
              validator: Validators.passwordValidator,
            ),
            separator,
            GenericInput(
              title: 'Data de nascimento - opcional',
              controller: _birthDateController,
              inputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              validator: Validators.dateValidator,
              inputFormatters: <TextInputFormatter>[Masks.date()],
              onFieldSubmitted: (String _) => _signUp(),
            ),
            separator,
            GenericButton(
              title: 'Cadastrar',
              variant: ButtonVariant.dark,
              onPressed: () => _signUp(),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState.validate() || _passwordController.text == _repeatPasswordController.text) {
      bloc.add(
        LoginBlocEventSignUp(
          password: _passwordController.text,
          birthDate: _birthDateController.text,
          name: _nameController.text,
          email: _emailController.text,
        ),
      );
    }
  }
}
