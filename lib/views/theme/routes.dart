import 'package:flutter/material.dart';
import 'package:desafio_capyba/views/login_screen.dart';
import 'package:desafio_capyba/views/register_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
    };
  }
}