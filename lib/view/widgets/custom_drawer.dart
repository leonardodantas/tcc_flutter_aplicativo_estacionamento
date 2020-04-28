import 'package:feira/controller/store/login_user.dart';
import 'package:feira/view/widgets/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  final _loginUser = GetIt.I.get<LoginUser>();

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    final _loginUser = GetIt.I.get<LoginUser>();
    //criação do Drawer
    return Drawer(
      child: Stack(
        children: <Widget>[
          //utilização de uma lista do menu

          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  //padding: EdgeInsets.only(left: 32.0, top: 16.0),
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(_loginUser.usuario.name),
                      accountEmail: Text(_loginUser.usuario.email),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Colors.blue
                                : Colors.white,
                        child: Text(
                          _loginUser.usuario.siglaNomeUsuario,
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                    DrawerTiler(Icons.home, "Inicio", pageController, 0),
                    DrawerTiler(Icons.list, "Cupons", pageController, 1),
                    DrawerTiler(
                        Icons.directions_car, "Automoveis", pageController, 2),
                    DrawerTiler(Icons.credit_card, "Pagamentos",
                        pageController, 3),
                    DrawerTiler(Icons.playlist_add_check, "Configurações",
                        pageController, 4),
                  ],
                ),
              ),
              Container(
                child: Material(
                  color: Colors.transparent,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: InkWell(
                      onTap: _loginUser.logout,
                      //container onde ficara a linha
                      child: Container(
                        padding: EdgeInsets.only(left: 32, right: 16),
                        height: 60.0,
                        //a linha tera um icone, o sizeBox para dar um espaço e o text
                        child: Column(
                          children: <Widget>[
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Sair",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey[700]),
                                ),
                                Icon(
                                  Icons.exit_to_app,
                                  size: 32.0,
                                  color: Colors.grey[700],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
