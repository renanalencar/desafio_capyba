import 'package:desafio_capyba/controllers/user_controller.dart';
import 'package:desafio_capyba/locator.dart';
import 'package:desafio_capyba/models/user_model.dart';
import 'package:desafio_capyba/views/logged_tab.dart';
import 'package:desafio_capyba/views/profile/avatar.dart';
import 'package:desafio_capyba/views/restricted_tab.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              bottom: TabBar(
                indicatorColor: Colors.grey,
                tabs: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Logado",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Restrito",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ],
              ),
              backgroundColor: const Color(0xFF00EB5A),
            ),
            body: TabBarView(
              children: <Widget>[
                LoggedTab(),
                RestrictedTab(),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                      child: Column(
                        children: [
                          Avatar(
                            avatarUrl: _currentUser?.avatarUrl,
                            onTap: () async {},
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              _currentUser.displayName ?? "TEXT",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00EB5A),
                    ),
                  ),
                  ListTile(
                    title: Text('Validar E-mail'),
                    onTap: () async {
                      await locator.get<UserController>().isEmailVerified()
                          ? Navigator.of(context)
                              .pushNamed(AppRoutes.verifyEmail)
                          : Navigator.of(context)
                              .pushNamed(AppRoutes.verifyEmail);
                    },
                  ),
                  ListTile(
                    title: Text('Editar'),
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.profile);
                    },
                  ),
                  ListTile(
                    title: Text('Sair'),
                    onTap: () {
                      locator.get<UserController>().signOut();
                      Navigator.of(context).pushNamed(AppRoutes.openning);
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
