import 'package:flutter/material.dart';

class ButtonVerificacao extends StatelessWidget {

  final String textButton;
  final Color colorText;
  final Color colorButton;
  final Function onPressed;

  ButtonVerificacao({@required this.textButton, @required this.colorButton, @required this.colorText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 0,
        padding: EdgeInsets.only(top: 15, bottom: 15, right: 60, left: 60),
        onPressed: onPressed,
        child: Text("${this.textButton}",
            style: TextStyle(color: this.colorText, fontSize: 16)),
        color: this.colorButton);
  }
}
