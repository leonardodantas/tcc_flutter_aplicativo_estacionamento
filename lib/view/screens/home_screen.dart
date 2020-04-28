import 'package:feira/controller/store/login_user.dart';
import 'package:feira/view/screens/login_screen.dart';
import 'package:feira/view/screens/signup_screen.dart';
import 'package:feira/view/screens/tela_inicial_usuario.dart';
import 'package:feira/view/widgets/tiles/buttonbig_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _loginUser = GetIt.I.get<LoginUser>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._loginUser.verificarSeExisteUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Observer(builder: (_) {
        switch (_loginUser.verificarEstadoPaginaInicial) {
          case ESTADOPAGINAAOINICIARAPLICATIVO.CARREGANDO:
            return Container(color: Colors.blue,
            child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)),
            );
            break;
          case ESTADOPAGINAAOINICIARAPLICATIVO.LOGADO:
            return TelaInicialUsuarioScreen();
            break;
          case ESTADOPAGINAAOINICIARAPLICATIVO.NAOLOGADO:
            return Container(
              color: Colors.blue,
                padding: EdgeInsets.only(top: 200, left: 40, right: 40),
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                    Text(
                      "CARESTA",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 175),
                    ButtonBig(
                        corContainer: Colors.blue,
                        corBorda: Colors.white,
                        textoBotao: "SIGN UP",
                        function: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Signup()));
                        },
                        corTexto: Colors.white),
                    SizedBox(height: 10),
                    ButtonBig(
                        corContainer: Colors.white,
                        corBorda: Colors.blue,
                        textoBotao: "LOGIN",
                        function: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        corTexto: Colors.blue),
                  ],
                ),
              );
            
            break;
          default:
            return Container();
            break;
        }
      }),
      )
    );
  }
}
