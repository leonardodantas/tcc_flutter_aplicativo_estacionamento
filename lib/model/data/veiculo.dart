import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'veiculo.g.dart';

class Veiculos = _VeiculosBase with _$Veiculos;

abstract class _VeiculosBase with Store {

  @observable 
  String uid;
  @action
  setUid(String newUid) => uid = newUid;

  @observable 
  String placa;
  @action 
  setPlaca(String novaPlaca) => placa = novaPlaca;
  @computed

  bool get verificarPlaca {
    if(placa != null)
      return true;
    return false;
  }

  @observable 
  String modelo;
  @action 
  setModelo(String novoModelo) => modelo = novoModelo;

  @observable 
  String fabricante;
  @action 
  setFabricante(String novoFabricante) => fabricante = novoFabricante;

  @observable 
  String anoFabricacao;
  @action 
  setAnoFabricacao(String novoAnoFabricacao) => anoFabricacao = novoAnoFabricacao;

  Map<String, dynamic> toMap(){
    return {
      'placa': placa,
      'modelo': modelo,
      'fabricante': fabricante,
      'anoFabricacao': anoFabricacao
    };
  }

}