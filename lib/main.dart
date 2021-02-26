import 'package:flutter/material.dart';
import 'package:desafio_capyba/views/opening_screen.dart';
import 'package:desafio_capyba/views/theme/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Capyba',
      routes: AppRoutes.define(),
      home: OpeningView(),
    );
  }
}
