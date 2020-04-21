import 'package:flutter/material.dart';

class ButtonBig extends StatelessWidget {
  final Color corContainer;
  final Color corBorda;
  final Color corTexto;
  final String textoBotao;
  final Function function;

  ButtonBig(
      {this.corContainer,
      this.corBorda,
      this.textoBotao,
      this.function,
      this.corTexto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 40, left: 40),
      decoration: BoxDecoration(
          color: this.corContainer,
          border: Border.all(color: this.corBorda),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: FlatButton(
        child: Text("${this.textoBotao}",
            style: TextStyle(
                fontSize: 16, color: this.corTexto)), //color: Colors.green,

        onPressed: this.function,
      ),
    );
  }
}
