import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {

  final Color corContainer;
  final Color corBorda;

  ButtonLoading({this.corContainer, this.corBorda});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 40, left: 40),
      decoration: BoxDecoration(
          color: this.corContainer,
          border: Border.all(color: this.corBorda),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: FlatButton(
        child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation(Colors.white)),
        onPressed: null, //color: Colors.green,
      ),
    );
  }
}
