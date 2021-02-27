import 'package:flutter/material.dart';
import 'package:mesa_news/modules/login_module/pages/login_initial.page.dart';

void main() {
  runApp(MesaApp());
}

class MesaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xFFE5E5E5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginInitialPage(),
    );
  }
}
