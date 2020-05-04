import 'package:feira/view/screens/historico_veiculo.dart';
import 'package:flutter/material.dart';

class ListaDeAutomoveisTab extends StatefulWidget {
  @override
  _ListaDeAutomoveisTabState createState() => _ListaDeAutomoveisTabState();
}

class _ListaDeAutomoveisTabState extends State<ListaDeAutomoveisTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
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
                          "Fox",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          "hfjs-2039",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        Text(
                          "Woskvagem",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        Text(
                          "2018-2019",
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
                          onPressed: _showDialogAtivaoCartao,
                        ),
                        FlatButton(
                          child: const Text('HISTORICO'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HistoricoVeiculoState()));
                          },
                        ),
                        FlatButton(
                          child: const Text('EXCLUIR'),
                          onPressed: _showDialogDeletarVeiculo,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDialogAtivaoCartao() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Ativar cartão?"),
          content: new Text("Após ativado não poderá mais ser recuperado"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ativar"),
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
    ).then((v) {});
  }

  void _showDialogDeletarVeiculo() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Deletar Veiculo?"),
          content: new Text("Após deletado será excluido todo seu historico"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Deletar"),
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
    ).then((v) {});
  }
}
