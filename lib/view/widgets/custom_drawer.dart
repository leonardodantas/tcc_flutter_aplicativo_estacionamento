import 'package:feira/controller/store/login_user.dart';
import 'package:feira/view/widgets/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toast/toast.dart';

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
                    DrawerTiler(
                        Icons.credit_card, "Pagamentos", pageController, 3),
                    DrawerTiler(Icons.playlist_add_check, "Configurações",
                        pageController, 4),
                    Observer(builder: (_) {
                      if (!_loginUser.usuario.emailVerificado) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: FlatButton(
                            child: Text("Verifique seu e-mail",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.red)), //color: Colors.green,

                            onPressed: () {
                              _showDialog(context);
                            },
                          ),
                        );
                      } else
                        return Container();
                    })
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

  _showDialog(BuildContext context){
     showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verifique seu email!"),
          content: new Text(
              "Caso ainda não tenha recebido o email de confirmação, podemos reenvia-lo a você"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Reenvie o email"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text("Sair"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
           
          ],
        );
  }).then((v){
      if(v){
        _loginUser.enviarEmailDeConfirmacao();
        Toast.show("Email reenviado", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
     
  });
  
  }
}
