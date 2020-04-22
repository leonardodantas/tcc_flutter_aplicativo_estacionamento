import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'cartoes.g.dart';

class Cartoes = _CartoesBase with _$Cartoes;

enum ESTADOTELADECOMPRA { IDLE, AGUARDANDO }
enum ESTADOCOMPRA { NULL, SUCESSO, FALHA }

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

  @observable
  ESTADOCOMPRA estadoCompra = ESTADOCOMPRA.NULL;

  @action
  alterarEstadoDeCompra(ESTADOCOMPRA novoEstadoDeCompra) =>
      estadoCompra = novoEstadoDeCompra;

  @computed
  ESTADOCOMPRA get retornarEstadoCompra {
    return estadoCompra;
  }

  @action
  realizarCompraCartao() async {
    estadoteladecompra = ESTADOTELADECOMPRA.AGUARDANDO;
    print(valorTotal);
    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    FirebaseUser firebaseUser = await _auth.currentUser();
    String uid = firebaseUser.uid;

    try {
      Map<String, dynamic> data = convertCartoesComprados();
      await inserirCartaoComprado(uid, data, _firestore);
      valorTotal = 1.0;
      await atualizarQuantidadeDeCartoesUsuario(uid, _firestore, _auth);
      await alterarEstadoDeCompra(ESTADOCOMPRA.SUCESSO);
      await alterarEstadoDeCompra(ESTADOCOMPRA.NULL);
    } catch (e) {
      compraRealizadaSucesso = false;
      alterarEstadoDeCompra(ESTADOCOMPRA.FALHA);
    } finally {
      estadoteladecompra = ESTADOTELADECOMPRA.IDLE;
    }
  }

  Map<String, dynamic> convertCartoesComprados() {
    return {"quantidade": valorTotal, "data_compra": new DateTime.now()};
  }

  Future<void> inserirCartaoComprado(
      String uid, Map<String, dynamic> data, Firestore _firestore) async {
    await _firestore
        .collection("users")
        .document(uid)
        .collection("compra_cartoes")
        .add(data);
  }

  atualizarQuantidadeDeCartoesUsuario(
      String uid, Firestore _firestore, FirebaseAuth _auth) async {
    DocumentSnapshot documentSnapshot = await _firestore
        .collection("users")
        .document(uid)
        .collection("qtd_cartoes")
        .document(uid)
        .get();

        print(documentSnapshot.data);
  }
}
