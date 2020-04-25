import 'package:awesome_card/awesome_card.dart';
import 'package:feira/data/meio_pagamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InserirNovoCartao extends StatefulWidget {
  @override
  _InserirNovoCartaoState createState() => _InserirNovoCartaoState();
}

class _InserirNovoCartaoState extends State<InserirNovoCartao> {
  final MeioPagamento _meioPagamento = MeioPagamento();

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      _focusNode.hasFocus
          ? _meioPagamento.setShowBack(true)
          : _meioPagamento.setShowBack(false);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Montando a tela");
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Observer(builder: (_) {
              return CreditCard(
                cardNumber: _meioPagamento.getNumeroCartao,
                cardExpiry: _meioPagamento.getNovoExperityDate,
                cardHolderName: _meioPagamento.getCardHolderName,
                cvv: _meioPagamento.getCVV,
                showBackSide: _meioPagamento.getShowBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
              );
            }),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: "#### #### #### ####",
                          filter: {"#": RegExp(r'[0-9]')})
                    ],
                    decoration: InputDecoration(hintText: "Card Number"),
                    maxLength: 19,
                    onChanged: _meioPagamento.setNumeroCartao,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: "##/##", filter: {"#": RegExp(r'[0-9]')})
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Card Expiry"),
                    maxLength: 5,
                    onChanged: _meioPagamento.setExpiryDate,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Card Holder Name"),
                    onChanged: _meioPagamento.setCardHolderName,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "CVV"),
                    maxLength: 3,
                    onChanged: _meioPagamento.setCVV,
                    focusNode: _focusNode,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
