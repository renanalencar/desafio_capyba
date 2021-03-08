import 'package:flutter/material.dart';

verifyEmailModal(BuildContext context) {
  TextEditingController _tokenController = TextEditingController();

  final cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  final continuaButton = TextButton(
    child: Text("Confirmar"),
    onPressed: () {},
  );

  final tokenField = TextFormField(
    controller: _tokenController,
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
      hintText: "1234567",
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: Colors.black12,
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    title: Text("Verificação de E-mail"),
    content: Column(
      children: [Text("Digite o token recebido no seu e-mail:"), tokenField],
    ),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
