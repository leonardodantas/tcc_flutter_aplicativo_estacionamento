import 'package:feira/controller/store/veiculo_controller.dart';
import 'package:feira/view/widgets/tiles/button_loading.dart';
import 'package:feira/view/widgets/tiles/buttonbig_tile.dart';
import 'package:feira/view/widgets/tiles/input_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

class AdicionarAutomovel extends StatefulWidget {
  @override
  _AdicionarAutomovelState createState() => _AdicionarAutomovelState();
}

class _AdicionarAutomovelState extends State<AdicionarAutomovel> {
  final List<ReactionDisposer> _disposers = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _veiculoController = GetIt.I<VeiculoController>();
  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) async {
      switch (_veiculoController.recuperarEstadoVeiculoAoInserir) {
        case ESTADOVEICULOAOINSERIR.IDLE:
          break;
        case ESTADOVEICULOAOINSERIR.SUCESSO:
          _formKeyScreen1.currentState.reset();
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Sucesso ao inserir veiculo",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ));

          break;
        case ESTADOVEICULOAOINSERIR.FALHA:
          _formKeyScreen1.currentState.reset();
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              "Erro ao inserir veiculo",
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Novo Veiculo"), centerTitle: true,),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: _formKeyScreen1,
          child: ListView(
            children: <Widget>[
              Icon(Icons.directions_car, size: 200, color: Colors.blue,),
              SizedBox(height: 10,),
              InputTile(labelText: "Placa", obscuredText: false, onChange: _veiculoController.veiculo.setPlaca),
              SizedBox(height: 20,),
              InputTile(labelText: "Modelo", obscuredText: false, onChange: _veiculoController.veiculo.setModelo),
              SizedBox(height: 20,),
              InputTile(labelText: "Fabricante", obscuredText: false, onChange: _veiculoController.veiculo.setFabricante),
              SizedBox(height: 20,),
              InputTile(labelText: "Ano de Fabricação", obscuredText: false, mask: MaskTextInputFormatter(
                  mask: "####-####", filter: {"#": RegExp(r'[0-9]')}),inputType: TextInputType.number, onChange: _veiculoController.veiculo.setAnoFabricacao),
                  SizedBox(height: 30,),
              Observer(builder: (_){
                if(!_veiculoController.getCadastrarVeiculo){
                  return ButtonBig(textoBotao: "Inserir", corBorda: Colors.blue, corTexto: Colors.white, corContainer: Colors.blue, function: _veiculoController.veiculo.verificarPlaca ? _veiculoController.inserirVeiculo : null);
                } else {
                  return ButtonLoading(corContainer: Colors.blue, corBorda: Colors.blue,);
                }
              })
            ],
          ),
        )
      ),
    );
  }
}