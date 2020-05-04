import 'package:flutter/material.dart';

class HistoricoVeiculoState extends StatefulWidget {
  @override
  _HistoricoVeiculoStateState createState() => _HistoricoVeiculoStateState();
}

class _HistoricoVeiculoStateState extends State<HistoricoVeiculoState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Historico"), centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (contexnt, index){
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   Text("Fox", style: TextStyle(fontSize: 25, color: Colors.blue)),
                   Text("10/10/2019 - 20:19", style: TextStyle(fontSize: 15, color: Colors.blue)),
                ]),
                Divider()
              ],
            );
        } ),
      ),
    );
  }
}