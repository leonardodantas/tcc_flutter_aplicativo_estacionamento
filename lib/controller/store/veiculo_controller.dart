import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feira/model/data/veiculo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'veiculo_controller.g.dart';

class VeiculoController = _VeiculoControllerBase with _$VeiculoController;

enum ESTADOVEICULOAOINSERIR {IDLE, SUCESSO, FALHA}

abstract class _VeiculoControllerBase with Store {

  var veiculo = Veiculos();
  
  Firestore _firestore;
  FirebaseAuth _firebaseAuth;

  @observable 
  bool cadastrarVeiculo = false;
  @action
  setCadastrarVeiculo(bool cadastrar) => cadastrarVeiculo = cadastrar;
  @computed
  bool get getCadastrarVeiculo{
    return cadastrarVeiculo;
  }

  @observable 
  ESTADOVEICULOAOINSERIR estadoVeiculoAoInserir = ESTADOVEICULOAOINSERIR.IDLE;
  @action 
  setAlterarEstadoVeiculoAoInserir(ESTADOVEICULOAOINSERIR novoEstado) => estadoVeiculoAoInserir = novoEstado;
  @computed 
  ESTADOVEICULOAOINSERIR get recuperarEstadoVeiculoAoInserir {
    return estadoVeiculoAoInserir;
  }

  inserirVeiculo() async {
    setCadastrarVeiculo(true);
    try {
      _firestore = Firestore.instance;
      FirebaseUser firebaseUser = await recuperarUidUsuario();

      _firestore.collection("users").document(firebaseUser.uid)
              .collection("automoveis").document()
             .setData(veiculo.toMap());
      
      setAlterarEstadoVeiculoAoInserir(ESTADOVEICULOAOINSERIR.SUCESSO);
      
    } catch (e) {
      setAlterarEstadoVeiculoAoInserir(ESTADOVEICULOAOINSERIR.FALHA);
      print(e);
    } finally {
      zerarVariaveis();
      setCadastrarVeiculo(false);
    }
    
  }

  zerarVariaveis(){
    veiculo.setUid("");
    veiculo.setAnoFabricacao("");
    veiculo.setFabricante("");
    veiculo.setModelo("");
    veiculo.setPlaca("");
  }

  Future<FirebaseUser> recuperarUidUsuario() async {
    FirebaseUser firebaseUser;
    try {
      firebaseUser = await FirebaseAuth.instance.currentUser();
    } catch (e) {
      print(e);
    }
    return firebaseUser;
  }

  Future<QuerySnapshot> listarTodosOsVeiculos() async {
    
    QuerySnapshot veiculos;
    try {
      _firestore = Firestore.instance;
      FirebaseUser firebaseUser = await recuperarUidUsuario();
      veiculos = await _firestore.collection("users").document(firebaseUser.uid)
              .collection("automoveis").getDocuments();
    } catch (e) {
      print(e);
    }
    return veiculos;
  }

  int quantidadeDeVeiculos(int quantidade) {
    return quantidade.isNaN ? 0 : quantidade;
  }
}