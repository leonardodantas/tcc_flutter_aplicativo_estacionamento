import 'package:feira/view/screens/historico_veiculo.dart';
import 'package:flutter/material.dart';

class AutomovelTile extends StatelessWidget {

  final String modelo;
  final String anoFabricante;
  final String fabricante;
  final String placa;
  final Function deletarVeiculo;
  final Function ativarCartao;

  AutomovelTile({this.modelo, this.anoFabricante, this.fabricante, this.placa, this.ativarCartao, this.deletarVeiculo});  

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.directions_car,
              size: 200,
              color: Colors.blue,
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${this.modelo}",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "${this.placa}",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Text(
                    "${this.fabricante}",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Text(
                    "${this.anoFabricante}",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ],
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.center,
              child: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: const Text('ATIVAR'),
                    onPressed: this.ativarCartao,
                  ),
                  FlatButton(
                    child: const Text('HISTORICO'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoricoVeiculoState()));
                    },
                  ),
                  FlatButton(
                    child: const Text('EXCLUIR'),
                    onPressed: this.deletarVeiculo,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
