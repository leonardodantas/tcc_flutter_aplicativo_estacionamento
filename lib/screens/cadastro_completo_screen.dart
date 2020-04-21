import 'package:feira/screens/tela_inicial_usuario.dart';
import 'package:feira/store/login_user.dart';
import 'package:feira/widgets/tiles/button_loading.dart';
import 'package:feira/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/widgets/tiles/input_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroCompleto extends StatefulWidget {
  @override
  _CadastroCompletoState createState() => _CadastroCompletoState();
}

class _CadastroCompletoState extends State<CadastroCompleto> {
  final _loginUser = GetIt.I.get<LoginUser>();

  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

 

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) async {
      switch (_loginUser.cadastroconcluidoestado) {
        case CADASTROCONCLUIDOESTADO.IDEL:
          break;
        case CADASTROCONCLUIDOESTADO.SUCCESS:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaInicialUsuarioScreen()));
          break;
        case CADASTROCONCLUIDOESTADO.FAIL:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Erro ao Completar Dados",
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
      body: ListView(
        padding: EdgeInsets.only(top: 55, right: 25, left: 25, bottom: 50),
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            child: Icon(
              Icons.check,
              color: Colors.blue,
              size: 100,
            ),
          ),
          SizedBox(height: 40),
          InputTile(
            obscuredText: false,
            labelText: "Profissão",
            inputType: TextInputType.text,
            onChange: _loginUser.usuario.changeProfissao,
          ),
          SizedBox(
            height: 10,
          ),
          InputTile(
              mask: MaskTextInputFormatter(
                  mask: "###.###.###.##", filter: {"#": RegExp(r'[0-9]')}),
              obscuredText: false,
              labelText: "CPF",
              inputType: TextInputType.number,
              onChange: _loginUser.usuario.changeCPF),
          SizedBox(
            height: 10,
          ),
          InputTile(
              mask: MaskTextInputFormatter(
                  mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')}),
              obscuredText: false,
              labelText: "Data de Nascimento",
              inputType: TextInputType.datetime,
              onChange: _loginUser.usuario.changeData),
          SizedBox(
            height: 10,
          ),
          InputTile(
            obscuredText: false,
            labelText: "Renda Mensal",
            inputType: TextInputType.number,
            onChange: _loginUser.usuario.changeRenda,
          ),
          SizedBox(
            height: 10,
          ),
          InputTile(
              mask: MaskTextInputFormatter(
                  mask: "#####-###", filter: {"#": RegExp(r'[0-9]')}),
              obscuredText: false,
              labelText: "CEP",
              inputType: TextInputType.text,
              onChange: _loginUser.usuario.changeCep),
          SizedBox(
            height: 10,
          ),
          InputTile(
              mask: MaskTextInputFormatter(
                  mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')}),
              obscuredText: false,
              labelText: "Celular",
              inputType: TextInputType.number,
              onChange: _loginUser.usuario.changeCelular),
          SizedBox(
            height: 60,
          ),
          Observer(builder: (_) {
            if (!_loginUser.cadastroCompletoConcluido) {
              return ButtonBig(
                  corBorda: Colors.blue,
                  corContainer: Colors.blue,
                  corTexto: Colors.white,
                  textoBotao: "Finalizar",
                  function: _loginUser.completarDados);
            } else {
              return ButtonLoading(
                corBorda: Colors.blue,
                corContainer: Colors.blue,
              );
            }
          })
        ],
      ),
    );
  }
}
