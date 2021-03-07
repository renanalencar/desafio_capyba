import 'package:desafio_capyba/views/menu.dart';
import 'package:flutter/material.dart';
import 'package:desafio_capyba/views/opening_screen.dart';
import 'package:desafio_capyba/views/theme/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/user_controller.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Capyba',
      routes: AppRoutes.define(),
      home: locator.get<UserController>().currentUser == null
          ? OpeningView()
          : MenuScreen(),
    );
  }
}
