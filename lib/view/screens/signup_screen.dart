import 'package:feira/controller/store/login_user.dart';
import 'package:feira/view/widgets/tiles/button_loading.dart';
import 'package:feira/view/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/view/widgets/tiles/input_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _loginUser = GetIt.I.get<LoginUser>();
  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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

      _disposers.add(
        autorun((_) async {

          switch(_loginUser.state){
            case STATES.IDEL:
            break;
            case STATES.SUCCESS:
              print("Cadastrou");
            _formKeyScreen1.currentState.reset();
            _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Cadastro Realizado com Sucesso", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 4),
            ));
            break;
            case STATES.FAIL:
             _formKeyScreen1.currentState.reset();
            _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Erro ao Realizar Cadastro", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ));
            break;
          }
          
        })
      );
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
                    validation: _loginUser.validationEmail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputTile(
                    inputType: TextInputType.text,
                    obscuredText: false,
                    labelText: "NOME",
                    onChange: _loginUser.usuario.changeName,
                    validation: _loginUser.validationName,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputTile(
                    inputType: TextInputType.text,
                    obscuredText: true,
                    labelText: "SENHA",
                    onChange: _loginUser.usuario.changePassword,
                    validation: _loginUser.validationPassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputTile(
                    inputType: TextInputType.emailAddress,
                    obscuredText: true,
                    labelText: "CONFIRME A SENHA",
                    onChange: _loginUser.changeConfPassword,
                    validation: _loginUser.comparePassword,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Observer(builder: (_) {
                    if (!_loginUser.inserir)
                      return ButtonBig(
                          corBorda: Colors.blue,
                          corContainer: Colors.blue,
                          corTexto: Colors.white,
                          textoBotao: "CADASTRAR",
                          function: _loginUser.isValid
                              ? _loginUser.cadastrarUsuario
                              : null);
                    else {
                      return ButtonLoading(
                          corBorda: Colors.blue, corContainer: Colors.blue);
                    }
                  }),
                ],
              ),
            )));
  }
}
