import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'cartoes.g.dart';

class Cartoes = _CartoesBase with _$Cartoes;

enum ESTADOTELADECOMPRA { IDLE, AGUARDANDO }
enum ESTADOCOMPRA { NULL, SUCESSO, FALHA }
enum ESTADOCARREGANDOQUANTIDADECARTOES {CARREGANDO, SUCCESS}

abstract class _CartoesBase with Store {
  FirebaseAuth _auth;
  Firestore _firestore;

  @observable
  double valorUnitario = 1;

  @observable
  double valorTotal = 1.00;

  @observable
  String cartaoSelecionado;

  @observable
  double qtdCartoesUsuario = 0;

  @action
  alterarQuantidadeCartoesUsuario(double novaQuantidade) => qtdCartoesUsuario = novaQuantidade;

  @computed
  get quantidadeDeCartoesDoUsuario {
    return qtdCartoesUsuario;
  }

  @observable
  ESTADOCARREGANDOQUANTIDADECARTOES _estadocarregandoquantidadecartoes;

  @computed
  ESTADOCARREGANDOQUANTIDADECARTOES get estadocarreadoquantidadecartoes  {
    return _estadocarregandoquantidadecartoes;
  }

  @action
  alterarEstadoCarregandoQuantidadeCartoes(ESTADOCARREGANDOQUANTIDADECARTOES novoEstado) => _estadocarregandoquantidadecartoes = novoEstado;


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
  verificarQuantidadeDeCartoesUsuario() async{
    alterarEstadoCarregandoQuantidadeCartoes(ESTADOCARREGANDOQUANTIDADECARTOES.CARREGANDO);
    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    String uid  = await recuperarUidUsuario();
    double valor = await recuperarQuantidadeDeCartoesDoUsuario(uid);
    alterarQuantidadeCartoesUsuario(valor);
    alterarEstadoCarregandoQuantidadeCartoes(ESTADOCARREGANDOQUANTIDADECARTOES.SUCCESS);
  }

  Future<double> recuperarQuantidadeDeCartoesDoUsuario(String uid) async {
    DocumentSnapshot documentSnapshot = await _firestore
          .collection("users")
          .document(uid)
          .collection("qtd_cartoes")
          .document(uid)
          .get();
    double valor = double.parse(documentSnapshot.data["qtd"].toString());
    return valor;
  }

  Future<String> recuperarUidUsuario() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    return firebaseUser.uid;
  }

  @action
  realizarCompraCartao() async {
    estadoteladecompra = ESTADOTELADECOMPRA.AGUARDANDO;

    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    String uid  = await recuperarUidUsuario();

    try {
      Map<String, dynamic> data = convertCartoesComprados();
      await inserirCartaoComprado(uid, data, _firestore);

      await atualizarQuantidadeDeCartoesUsuario(uid, _firestore, _auth);
      await alterarEstadoDeCompra(ESTADOCOMPRA.SUCESSO);
      await alterarEstadoDeCompra(ESTADOCOMPRA.NULL);
      valorTotal = 1.0;
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
    try {
      double quantidadeUsuario = await recuperarQuantidadeDeCartoesDoUsuario(uid);
      double quantidadeComprada = valorTotal;

      double novaQuantidade = quantidadeComprada + quantidadeUsuario.toDouble();
      await _firestore
          .collection("users")
          .document(uid)
          .collection("qtd_cartoes")
          .document(uid)
          .setData({"qtd": novaQuantidade});
    } catch (e) {
      print(e);
    }
  }
}
