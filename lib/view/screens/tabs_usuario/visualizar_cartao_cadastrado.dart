import 'package:awesome_card/awesome_card.dart';
import 'package:feira/controller/store/cartoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class VisualizarCartaoCadastradoTile extends StatefulWidget {
  @override
  _VisualizarCartaoCadastradoTileState createState() => _VisualizarCartaoCadastradoTileState();
}

class _VisualizarCartaoCadastradoTileState extends State<VisualizarCartaoCadastradoTile> {

  final Cartoes _cartoes = GetIt.I<Cartoes>();

  _VisualizarCartaoCadastradoTileState(){
    print("LEONARDO INICIOU");
    _cartoes.verificarCartaoCadastrado();
     print(_cartoes.meioPagamento.cardNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Observer(builder: (_){
        if(!_cartoes.retornarInformacaoCartao){
          return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),),);
        }
        else {
          return CreditCard(
                cardNumber: "${_cartoes.meioPagamento.cardNumber}",
                cardExpiry: "${_cartoes.meioPagamento.expiryDate}",
                cardHolderName: "${_cartoes.meioPagamento.cardHolderName}",
                cvv: "${_cartoes.meioPagamento.cvv}",
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
              );
        }
      })
           
    );
  }
}