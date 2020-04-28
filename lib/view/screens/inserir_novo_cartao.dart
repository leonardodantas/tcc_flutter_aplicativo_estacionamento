import 'package:awesome_card/awesome_card.dart';
import 'package:feira/controller/store/cartoes.dart';
import 'package:feira/view/widgets/tiles/button_loading.dart';
import 'package:feira/view/widgets/tiles/buttonbig_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

class InserirNovoCartao extends StatefulWidget {
  @override
  _InserirNovoCartaoState createState() => _InserirNovoCartaoState();
}

class _InserirNovoCartaoState extends State<InserirNovoCartao> {

  final Cartoes _cartoes = GetIt.I<Cartoes>();
  final List<ReactionDisposer> _disposers = [];

  FocusNode _focusNode;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) async {
      switch(_cartoes.getEstadoAoAtualizarCartao){
        case ESTADOATUALIZARCARTAO.IDEL:
        break;
        case ESTADOATUALIZARCARTAO.SUCCESS:
         showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sucesso!"),
          content: new Text(
              "Sucesso ao inserir cartão!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
           
          ],
        );
      },
    ).then((v){
      if(v){
        Navigator.pop(context);
      }
    });
        break;
        case ESTADOATUALIZARCARTAO.FAIL:
          return AlertDialog(
          title: new Text("Erro ao atualizar cartão!"),
          content: new Text(
              "Tente novamente mais tarde"),
            actions: <Widget>[
              new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },)
            ],
        );
        break;
      }
      
    }));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      _focusNode.hasFocus
          ? _cartoes.meioPagamento.setShowBack(true)
          : _cartoes.meioPagamento.setShowBack(false);
    });
    
    _cartoes.setEstadoAtualizarCartao(ESTADOATUALIZARCARTAO.IDEL);
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
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
                cardNumber: _cartoes.meioPagamento.getNumeroCartao,
                cardExpiry: _cartoes.meioPagamento.getNovoExperityDate,
                cardHolderName: _cartoes.meioPagamento.getCardHolderName,
                cvv: _cartoes.meioPagamento.getCVV,
                showBackSide: _cartoes.meioPagamento.getShowBack,
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
                      onChanged: _cartoes.meioPagamento.setNumeroCartao,
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
                      onChanged: _cartoes.meioPagamento.setExpiryDate,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Card Holder Name"),
                      onChanged: _cartoes.meioPagamento.setCardHolderName,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "CVV"),
                      maxLength: 3,
                      onChanged: _cartoes.meioPagamento.setCVV,
                      focusNode: _focusNode,
                    ),
                  )
                ]),
            SizedBox(
              height: 30,
            ),
            Observer(builder: (_) {
              if (!_cartoes.getVerificarCadastrandoNovoCartao) {
                return Container(
                  alignment: Alignment.center,
                  child: ButtonBig(
                      corBorda: Colors.blue,
                      corContainer: Colors.blue,
                      corTexto: Colors.white,
                      function: _cartoes.botaoAtualizarCartaoPagamento
                          ? _cartoes.atualizarCartaoUsuario
                          :  null,
                      textoBotao: "Cadastrar"),
                );
              } else {
                return Container(
                    alignment: Alignment.center,
                    child: ButtonLoading(
                      corBorda: Colors.blue,
                      corContainer: Colors.blue,
                    ));
              }
            })
          ],
        ),
      ),
    );
  }
}
