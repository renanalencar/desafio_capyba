import 'dart:io';

import 'package:desafio_capyba/controllers/user_controller.dart';
import 'package:desafio_capyba/locator.dart';
import 'package:flutter/material.dart';
import 'package:desafio_capyba/views/theme/routes.dart';
import 'package:desafio_capyba/views/profile/avatar.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  String _avatarUrl;
  File _avatarImage;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: mq.size.height / 4,
    );

    final avatar = Avatar(
      avatarUrl: _avatarUrl,
      onTap: () async {
        _avatarImage = File((await ImagePicker().getImage(
                source: ImageSource.camera,
                preferredCameraDevice: CameraDevice.front))
            .path);
        _avatarUrl = _avatarImage.path;
        setState(() {});
      },
    );

    final usernameField = TextFormField(
      controller: _usernameController,
      validator: (val) {
        if (val.isEmpty) return 'Campo obrigatório';
        return null;
      },
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: "Carlos Silva",
        labelText: "Usuário",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black12,
        ),
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      validator: (val) {
        if (val.isEmpty) return 'Campo obrigatório';
        if (validateEmail(val)) return 'E-mail inválido';
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: "exemplo@exemplo.com",
        labelText: "E-mail",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black12,
        ),
      ),
    );

    final passwordField = TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (val) {
        if (val.isEmpty) return 'Campo obrigatório';
        return null;
      },
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: "senha",
        labelText: "Senha",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black12,
        ),
      ),
    );

    final repasswordField = TextFormField(
      obscureText: true,
      controller: _repasswordController,
      validator: (val) {
        if (val.isEmpty) return 'Campo obrigatório';
        if (val != _passwordController.text) return 'Senhas não conferem';
        return null;
      },
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: "senha",
        labelText: "Repita a senha",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black12,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          avatar,
          usernameField,
          emailField,
          passwordField,
          repasswordField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text("Cadastrar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () async {
          if (_formKey.currentState.validate() && _avatarUrl != null) {
            await locator.get<UserController>().createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
            await locator
                .get<UserController>()
                .uploadProfilePicture(_avatarImage);
            Navigator.of(context).pushNamed(AppRoutes.menu);
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Já é cadastrado?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black),
            ),
            MaterialButton(
                child: Text(
                  "Entrar",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.authLogin);
                }),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 36, right: 36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
