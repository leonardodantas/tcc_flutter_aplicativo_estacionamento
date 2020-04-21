import 'package:feira/widgets/cartoes_comprados.dart';
import 'package:flutter/material.dart';

class InicioUsuarioTab extends StatefulWidget {
  @override
  _InicioUsuarioTabState createState() => _InicioUsuarioTabState();
}

class _InicioUsuarioTabState extends State<InicioUsuarioTab> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "50",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
