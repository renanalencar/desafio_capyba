import 'package:desafio_capyba/controllers/user_controller.dart';
import 'package:desafio_capyba/locator.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/views/profile/avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String route = "profile-view";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  UserModel _currentUser = locator.get<UserController>().currentUser;

  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _displayNameController.text = _currentUser.displayName ?? "Null";
    _emailController.text = _currentUser.email ?? "Null";

    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: mq.size.height / 4,
    );

    final avatar = Avatar(
      avatarUrl: _currentUser?.avatarUrl,
      onTap: () {},
    );

    final usernameField = TextFormField(
      controller: _displayNameController,
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
      // enabled: isSubmitting,
      controller: _emailController,
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

    final newPasswordField = TextFormField(
      obscureText: true,
      controller: _repasswordController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: "senha",
        labelText: "Nova senha",
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
          usernameField,
          emailField,
          passwordField,
          newPasswordField,
        ],
      ),
    );

    final updateButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text("Atualizar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () async {},
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: const Color(0xFF00EB5A),
      ),
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
                avatar,
                fields,
                updateButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
