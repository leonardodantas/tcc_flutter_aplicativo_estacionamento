import 'package:flutter/material.dart';

class FloatingActionComprarCartao extends StatelessWidget {

  final Function onPressed;

  FloatingActionComprarCartao({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: onPressed,
      child: Icon(Icons.attach_money, color: Colors.blue,size: 50,),
      backgroundColor: Colors.white,
    );
  }
}
