import 'package:flutter/material.dart';

class FloatingActionAtualizarPagamento extends StatelessWidget {

  final Function onPressed;

  FloatingActionAtualizarPagamento({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: onPressed,
      child: Icon(Icons.credit_card, color: Colors.white,size: 50,),
      backgroundColor: Colors.blue,
    );
  }
}
