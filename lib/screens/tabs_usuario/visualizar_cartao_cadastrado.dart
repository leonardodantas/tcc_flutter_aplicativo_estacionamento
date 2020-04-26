import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class VisualizarCartaoCadastradoTile extends StatefulWidget {
  @override
  _VisualizarCartaoCadastradoTileState createState() => _VisualizarCartaoCadastradoTileState();
}

class _VisualizarCartaoCadastradoTileState extends State<VisualizarCartaoCadastradoTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreditCard(
                cardNumber: "XXXX XXXX XXXX XXXX",
                cardExpiry: "XX/XX",
                cardHolderName: "XXXXXXXXXX XXXX",
                cvv: "XXX",
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
              ),
      
    );
  }
}