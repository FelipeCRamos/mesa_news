import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mesa_news/shared/widgets/generic_button_widget.dart';

class LoginInitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010A53),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/logo 1.svg'),
                  const SizedBox(height: 20),
                  SvgPicture.asset('assets/NEWS.svg', color: Colors.white),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                GenericButton(
                  title: 'Entrar com facebook',
                  onPressed: _doSignInWithFacebook,
                  variant: ButtonVariant.outlineLight,
                ),
                GenericButton(
                  title: 'Entrar com e-mail',
                  variant: ButtonVariant.outlineDark,
                  onPressed: _doSignInWithEmail,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Não tenho conta.',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: _doSignUp,
                        child: Text(
                          'Cadastrar',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF00B2FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _doSignUp() {
    // TODO
  }

  void _doSignInWithEmail() {
    // TODO
  }

  void _doSignInWithFacebook() {
    // TODO
  }
}
