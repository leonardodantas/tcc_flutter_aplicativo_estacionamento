import 'package:feira/store/cartoes.dart';
import 'package:feira/widgets/cartoes_comprados.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class InicioUsuarioTab extends StatefulWidget {
  @override
  _InicioUsuarioTabState createState() => _InicioUsuarioTabState();
}

class _InicioUsuarioTabState extends State<InicioUsuarioTab> {
 
  final _cartoes = GetIt.I.get<Cartoes>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartoes.verificarQuantidadeDeCartoesUsuario();
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Center(
            child: Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),
              padding: EdgeInsets.only(top: 150),
              height: 450,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Meu Saldo",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (_) {
                    switch (_cartoes.estadocarreadoquantidadecartoes) {
                      case ESTADOCARREGANDOQUANTIDADECARTOES.CARREGANDO:
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                        );
                        break;
                      case ESTADOCARREGANDOQUANTIDADECARTOES.SUCCESS:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${_cartoes.quantidadeDeCartoesDoUsuario.toString()}",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                        break;
                        default: return Container();
                        break;
                    }
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cada saldo equivale a uma hora",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
