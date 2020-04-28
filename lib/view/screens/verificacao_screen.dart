import 'package:feira/view/screens/cadastro_completo_screen.dart';
import 'package:feira/view/screens/tela_inicial_usuario.dart';
import 'package:feira/view/widgets/tiles/button_verificacao.dart';
import 'package:flutter/material.dart';

class Verificacao extends StatefulWidget {
  @override
  _VerificacaoState createState() => _VerificacaoState();
}

class _VerificacaoState extends State<Verificacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Icon(Icons.supervised_user_circle, color: Colors.blue, size: 200),
            Container(
              padding: EdgeInsets.only(top:35, left: 15, right: 15),
              child: Text(
                "Notamos que ainda não completou suas informações basicas.",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 50, left: 15, right: 15),
              child: Text(
                "Deseja completa-las para uma experiencia melhor?",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            ButtonVerificacao(textButton:"Lembre-me depois",colorButton: Colors.blue, colorText: Colors.white, onPressed: (){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => TelaInicialUsuarioScreen()));
            }),
            SizedBox(height: 20),
            ButtonVerificacao(textButton: "Sim, desejo uma melhor experiencia", colorText: Colors.blue, colorButton: Colors.white, onPressed: (){
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CadastroCompleto()));
            },)
          ],
        ),
      ),
    );
  }
}
