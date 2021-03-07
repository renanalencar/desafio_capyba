import 'package:desafio_capyba/controllers/user_controller.dart';
import 'package:desafio_capyba/locator.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/views/profile/avatar.dart';
import 'package:desafio_capyba/views/theme/routes.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  UserModel _currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      appBar: AppBar(title: Text("Home Screen")),
      body: Text("Home"),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Avatar(
                avatarUrl: _currentUser?.avatarUrl,
                onTap: () async {},
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Editar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushNamed(AppRoutes.profile);
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                locator.get<UserController>().signOut();
                Navigator.of(context).pushNamed(AppRoutes.openning);
              },
            ),
          ],
        ),
      ),
    );
  }
}
