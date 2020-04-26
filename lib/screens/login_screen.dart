import 'package:feira/screens/recuperar_tela.dart';
import 'package:feira/screens/tela_inicial_usuario.dart';
import 'package:feira/screens/verificacao_screen.dart';
import 'package:feira/store/login_user.dart';
import 'package:feira/widgets/tiles/button_loading.dart';
import 'package:feira/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/widgets/tiles/input_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _loginUser = GetIt.I.get<LoginUser>();
  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginUser.zearVariaveis();
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) async {
      switch (_loginUser.state) {
        case STATES.IDEL:
          break;
        case STATES.SUCCESS:
          _formKeyScreen1.currentState.reset();
          if (!_loginUser.usuario.cadastroConcluido) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Verificacao()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaInicialUsuarioScreen()));
          }

          break;
        case STATES.FAIL:
          _formKeyScreen1.currentState.reset();
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Erro ao Logar",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ));
          break;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: 50),
        color: Colors.white,
        child: Form(
          key: _formKeyScreen1,
          child: ListView(
            padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.directions_car,
                  color: Colors.blue,
                  size: 100,
                ),
              ),
              SizedBox(height: 100),
              InputTile(
                inputType: TextInputType.emailAddress,
                obscuredText: false,
                labelText: "EMAIL",
                onChange: _loginUser.usuario.changeEmail,
                validation: _loginUser.validationEmailLogin,
              ),
              SizedBox(
                height: 10,
              ),
              InputTile(
                inputType: TextInputType.emailAddress,
                obscuredText: true,
                labelText: "SENHA",
                onChange: _loginUser.usuario.changePassword,
                validation: _loginUser.validationPasswordLogin,
              ),
              SizedBox(
                height: 60,
              ),
              Observer(builder: (_) {
                if (!_loginUser.cadastrarLoading)
                  return ButtonBig(
                      corBorda: Colors.blue,
                      corContainer: Colors.blue,
                      corTexto: Colors.white,
                      textoBotao: "ENTRAR",
                      function:
                          _loginUser.habilitarLogin ? _loginUser.login : null);
                else
                  return ButtonLoading(
                      corBorda: Colors.blue, corContainer: Colors.blue);
              }),
              SizedBox(height: 30),
              FlatButton(
                child: Container(child: Text("Esqueci minha senha",style: TextStyle(color: Colors.blue),)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecuperarTelaScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
