import 'package:feira/widgets/tiles/buttonbig_tile.dart';
import 'package:flutter/material.dart';

class ComprarCartoesScreen extends StatefulWidget {
  @override
  _ComprarCartoesScreenState createState() => _ComprarCartoesScreenState();
}

class _ComprarCartoesScreenState extends State<ComprarCartoesScreen> {
  String _currentValor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comprar Cartões"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Form(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Valor Unitario:",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    "R\$ 1,00",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Seleciona a quantidade:",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  DropdownButton(
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      onChanged: (v) {
                        _currentValor = v;
                      },
                      value: _currentValor,
                      items: getItens()),
                ],
              ),
              SizedBox(height: 30,),
              ButtonBig(textoBotao: "Comprar", corBorda: Colors.blue, corTexto: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getItens() {
    List<DropdownMenuItem<String>> itens = new List();
    
    for (var i = 0; i < 10; i++) {
      
      String value = i.toString();
      itens.add(new DropdownMenuItem(
          child: new Text(value), value: i.toString() + "a"));
        _currentValor = itens[0].value;
    }

    return itens;
  }
}
