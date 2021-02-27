import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SolidAppBar extends AppBar {
  SolidAppBar({
    @required String title,
    Color backgroundColor = const Color(0xFF010A53),
    VoidCallback onCancel,
  }) : super(
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          brightness: Brightness.dark,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: onCancel,
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
        );
}
