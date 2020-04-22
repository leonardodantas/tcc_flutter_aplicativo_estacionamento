import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'cartoes.g.dart';

class Cartoes = _CartoesBase with _$Cartoes;

enum ESTADOTELADECOMPRA { IDLE, AGUARDANDO }

abstract class _CartoesBase with Store {
  /**
   * 
   * CRIAR SNACKBAR PARA COMPRA REALZIADA COM SUCESSO OU COM FALHA
   * 
   * 
   */
  FirebaseAuth _auth;
  Firestore _firestore;

  @observable
  double valorUnitario = 1;

  @observable
  double valorTotal = 1.00;

  @observable
  String cartaoSelecionado;

  double get retornarValorTotal {
    return valorTotal;
  }

  @action
  escolherCartao(var value) {
    valorTotal = valorUnitario * int.parse(value);
  }

  @observable
  ESTADOTELADECOMPRA estadoteladecompra = ESTADOTELADECOMPRA.IDLE;

  @computed
  ESTADOTELADECOMPRA get verificarEstadoTelaDeCompra {
    return estadoteladecompra;
  }

  @observable
  bool compraRealizadaSucesso;

  @computed
  bool get retornarComprarRealizadaSucesso {
    return compraRealizadaSucesso;
  }

  @action
  realizarCompraCartao() async {
    estadoteladecompra = ESTADOTELADECOMPRA.AGUARDANDO;
    print(valorTotal);
    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    FirebaseUser firebaseUser = await _auth.currentUser();
    String uid = firebaseUser.uid;

    Map<String, dynamic> data = {
      "quantidade": valorTotal,
      "data_compra": new DateTime.now()
    };
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("compra_cartoes")
          .add(data);
    } catch (e) {

    } finally {
      estadoteladecompra = ESTADOTELADECOMPRA.IDLE;
      compraRealizadaSucesso = true;
    }
  }
}
