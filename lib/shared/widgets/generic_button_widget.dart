import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonVariant { light, dark, outlineDark, outlineLight }

class GenericButton extends StatelessWidget {
  const GenericButton({
    Key key,
    this.title,
    this.onPressed,
    this.active = true,
    this.variant = ButtonVariant.dark,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool active;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: variant == ButtonVariant.dark ||
                          variant == ButtonVariant.outlineDark
                      ? const Color(0xFF010A53)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: variant == ButtonVariant.outlineDark ||
                          variant == ButtonVariant.outlineLight
                      ? Border.all(
                          color: variant == ButtonVariant.outlineLight
                              ? const Color(0xFF010A53)
                              : Colors.white,
                        )
                      : null,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                ),
                child: Align(
                  child: Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: variant == ButtonVariant.light ||
                              variant == ButtonVariant.outlineLight
                          ? const Color(0xFF010A53)
                          : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: onPressed,
            ),
          ),
        )
      ],
    );
  }
}
