import 'package:desafio_capyba/views/verify_modal.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final veryButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text("Verificar E-mail",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          onPressed: () async {
            verifyEmailModal(context);
          },
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Validar E-mail",
          style: TextStyle(color: Colors.black),
        ),
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
                veryButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
