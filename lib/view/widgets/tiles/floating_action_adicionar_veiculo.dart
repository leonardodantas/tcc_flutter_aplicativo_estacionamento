import 'package:flutter/material.dart';

class FloatingActionAdicionarVeiculo extends StatelessWidget {

  final Function onPressed;

  FloatingActionAdicionarVeiculo({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: onPressed,
      child: Icon(Icons.directions_car, color: Colors.white,size: 50,),
      backgroundColor: Colors.blue,
    );
  }
}
