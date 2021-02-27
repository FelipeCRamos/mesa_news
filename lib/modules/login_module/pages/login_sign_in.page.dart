import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mesa_news/modules/login_module/shared/not_have_account_signup_widget.dart';
import 'package:mesa_news/shared/widgets/generic_button_widget.dart';
import 'package:mesa_news/shared/widgets/generic_input_widget.dart';
import 'package:mesa_news/shared/widgets/solid_app_bar_widget.dart';

class LoginSignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SolidAppBar(title: 'Entrar com e-mail'),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) =>
              SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SvgPicture.asset('assets/noun_login.svg'),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        GenericInput(
                          title: 'E-mail',
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (String value) {
                            if(value == '') {
                              return 'Por favor, digite um e-mail!';
                            }
                            if(value.isNotEmpty && (!value.contains('@') || !value.contains('.'))) {
                              return 'Por favor, insira um e-mail válido!';
                            }

                            return null;
                          }
                        ),
                        const SizedBox(height: 26),
                        GenericInput(
                          title: 'Senha',
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          inputType: TextInputType.text,
                          onFieldSubmitted: (String _) => _login(),
                          obscure: true,
                          validator: (String value) {
                            if (value == '') {
                              return 'Por favor, digite uma senha!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        GenericButton(
                          title: 'Login',
                          onPressed: _login,
                          variant: ButtonVariant.dark,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      GenericButton(
                        title: 'Entrar com facebook',
                        variant: ButtonVariant.outlineLight,
                        onPressed: _loginWithFacebook,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: NotHaveAccountSignup(
                          onTap: _doSignUp,
                          whiteBackground: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginWithFacebook() {
    // TODO
  }

  void _doSignUp() {
    // TODO
  }

  void _login() {
    _formKey.currentState.validate();
    // ... TODO
  }
}
