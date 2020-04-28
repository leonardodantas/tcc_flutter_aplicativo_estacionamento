import 'package:feira/controller/store/login_user.dart';
import 'package:feira/view/widgets/tiles/button_loading.dart';
import 'package:feira/view/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/view/widgets/tiles/input_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class RecuperarTelaScreen extends StatefulWidget {
  @override
  _RecuperarTelaScreenState createState() => _RecuperarTelaScreenState();
}

class _RecuperarTelaScreenState extends State<RecuperarTelaScreen> {
  
  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _loginUser = GetIt.I.get<LoginUser>();
  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) async {
      switch(_loginUser.estadoTelaRecuperarSenha){
        case ESTADORECUPERARSENHA.IDEL:
        break;
        case ESTADORECUPERARSENHA.SUCCESS:
         _formKeyScreen1.currentState.reset();
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Email Enviado com Sucesso",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ));
        break;
        case ESTADORECUPERARSENHA.FAIL:
         _formKeyScreen1.currentState.reset();
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Erro ao enviar email",
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
      appBar: AppBar(
        title: Text("Recuperar Tela"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: _formKeyScreen1,
          child: ListView(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30),
            children: <Widget>[
              InputTile(
                inputType: TextInputType.emailAddress,
                labelText: "Email para recuperar",
                validation: _loginUser.validarCampoEmailParaRecuperar,
                onChange: _loginUser.setEmailParaRecuperar,
                obscuredText: false,
              ),
              SizedBox(
                height: 40,
              ),
              Observer(
                builder: (_) {
                  if (!_loginUser.retornarbotaoRecuperarSenhaAcionado) {
                    return ButtonBig(
                      textoBotao: "Enviar",
                      corBorda: Colors.blue,
                      corTexto: Colors.white,
                      corContainer: Colors.blue,
                      function: _loginUser.buttonEmailParaRecuperarIsValid
                          ? _loginUser.enviarEmailParaRecuperarSenha
                          : null,
                    );
                  } else {
                    return ButtonLoading(
                      corContainer: Colors.blue,
                      corBorda: Colors.blue,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
