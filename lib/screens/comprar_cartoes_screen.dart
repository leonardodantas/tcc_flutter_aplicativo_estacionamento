import 'package:feira/store/cartoes.dart';
import 'package:feira/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/widgets/tiles/radio_button_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class ComprarCartoesScreen extends StatefulWidget {
  @override
  _ComprarCartoesScreenState createState() => _ComprarCartoesScreenState();
}

class _ComprarCartoesScreenState extends State<ComprarCartoesScreen> {
  
  final _cartoes = GetIt.I.get<Cartoes>();
  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) {
      switch (_cartoes.retornarEstadoCompra) {
        case ESTADOCOMPRA.NULL:
          break;
        case ESTADOCOMPRA.SUCESSO:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Compra Realizada com sucesso",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ));
          break;
        case ESTADOCOMPRA.FALHA:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Erro ao realizar compra",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ));
          break;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    print("Montando tela de cartoes");
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Comprar Cartões"),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          switch (_cartoes.verificarEstadoTelaDeCompra) {
            case ESTADOTELADECOMPRA.IDLE:
              return Container(
                padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      RadioButtonTileVetical(
                        text: "Selecione a quantidade:",
                        options: ["1", "2", "3", "4", "5"],
                        radionButtonValue: _cartoes.escolherCartao,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(40.0),
                                bottomRight: const Radius.circular(40.0),
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0),
                              )),
                          alignment: Alignment.center,
                          height: 300,
                          child: Observer(
                            builder: (retornarValorTotal) {
                              return Text(
                                "R\$ ${_cartoes.valorTotal.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36),
                              );
                            },
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonBig(
                        textoBotao: "Comprar",
                        corBorda: Colors.blue,
                        corTexto: Colors.blue,
                        function: _showDialog,
                      )
                    ],
                  ),
                ),
              );
              break;
            case ESTADOTELADECOMPRA.AGUARDANDO:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
              break;
            default:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
              break;
          }
        }));
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirmar Compra?"),
          content: new Text(
              "O valor será inserido no cartão credito/debito cadastrado no aplicativo"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirmar"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((v) {
      _cartoes.realizarCompraCartao().then((v) {
        
        _cartoes.verificarQuantidadeDeCartoesUsuario();
        print('nova quanidade');
        print(_cartoes.quantidadeDeCartoesDoUsuario);
      });
    });
  }
}
