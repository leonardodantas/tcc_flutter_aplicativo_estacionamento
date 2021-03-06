import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feira/model/data/meio_pagamento.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'cartoes.g.dart';

class Cartoes = _CartoesBase with _$Cartoes;

enum ESTADOTELADECOMPRA { IDLE, AGUARDANDO }
enum ESTADOCOMPRA { NULL, SUCESSO, FALHA }
enum ESTADOCARREGANDOQUANTIDADECARTOES { CARREGANDO, SUCCESS }
enum ESTADOATUALIZARCARTAO { IDEL, SUCCESS, FAIL }

abstract class _CartoesBase with Store {
  FirebaseAuth _auth;
  Firestore _firestore;

  var meioPagamento = MeioPagamento();

  @observable
  double valorUnitario = 1;

  @observable
  double valorTotal = 1.00;

  @observable
  String cartaoSelecionado;

  @observable
  double qtdCartoesUsuario = 0;

  @action
  alterarQuantidadeCartoesUsuario(double novaQuantidade) =>
      qtdCartoesUsuario = novaQuantidade;

  @computed
  get quantidadeDeCartoesDoUsuario {
    return qtdCartoesUsuario;
  }

  @observable
  ESTADOCARREGANDOQUANTIDADECARTOES _estadocarregandoquantidadecartoes;

  @computed
  ESTADOCARREGANDOQUANTIDADECARTOES get estadocarreadoquantidadecartoes {
    return _estadocarregandoquantidadecartoes;
  }

  @action
  alterarEstadoCarregandoQuantidadeCartoes(
          ESTADOCARREGANDOQUANTIDADECARTOES novoEstado) =>
      _estadocarregandoquantidadecartoes = novoEstado;

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

  @observable
  bool cadastrarNovoCartao = false;

  @action
  setCadastrarNovoCartao(bool novoCartao) => cadastrarNovoCartao = novoCartao;

  @computed
  bool get getVerificarCadastrandoNovoCartao {
    return cadastrarNovoCartao;
  }

  @observable
  ESTADOATUALIZARCARTAO estadoatualizarcartao = ESTADOATUALIZARCARTAO.IDEL;

  @action
  setEstadoAtualizarCartao(ESTADOATUALIZARCARTAO estado) =>
      estadoatualizarcartao = estado;

  @computed
  ESTADOATUALIZARCARTAO get getEstadoAoAtualizarCartao {
    return estadoatualizarcartao;
  }

  @observable
  bool informacoesCartao = false;

  @action
  setInformacaoCartao(bool info) => informacoesCartao = info;

  @computed
  bool get retornarInformacaoCartao {
    return informacoesCartao;
  }

  @action
  verificarQuantidadeDeCartoesUsuario() async {
    alterarEstadoCarregandoQuantidadeCartoes(
        ESTADOCARREGANDOQUANTIDADECARTOES.CARREGANDO);
    _auth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    String uid = await recuperarUidUsuario();
    double valor = await recuperarQuantidadeDeCartoesDoUsuario(uid);
    alterarQuantidadeCartoesUsuario(valor);
    alterarEstadoCarregandoQuantidadeCartoes(
        ESTADOCARREGANDOQUANTIDADECARTOES.SUCCESS);
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
    String uid = await recuperarUidUsuario();

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
      double quantidadeUsuario =
          await recuperarQuantidadeDeCartoesDoUsuario(uid);
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

  atualizarCartaoUsuario() async {
    setCadastrarNovoCartao(true);
    _auth = FirebaseAuth.instance;

    String uid = await recuperarUidUsuario();

    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("cartao_ativo")
          .document(uid)
          .updateData({"cartao": meioPagamento.toMap()});

      setEstadoAtualizarCartao(ESTADOATUALIZARCARTAO.SUCCESS);
    } catch (e) {
      setEstadoAtualizarCartao(ESTADOATUALIZARCARTAO.FAIL);
    } finally {
      setCadastrarNovoCartao(false);
    }
  }

  bool get botaoAtualizarCartaoPagamento {
    return meioPagamento.getCardHolderName.isNotEmpty &&
        meioPagamento.getNovoExperityDate.isNotEmpty &&
        meioPagamento.getNumeroCartao.isNotEmpty;
  }

  @action
  Future verificarCartaoCadastrado() async {
    setInformacaoCartao(false);
    String uid = await recuperarUidUsuario();
    try {
      var dados = await _firestore
          .collection("users")
          .document(uid)
          .collection("cartao_ativo")
          .document(uid)
          .get();

      if (dados.data["cartao"]["cardNumber"] != null) {
        await meioPagamento.toDataMeioPagamento(dados.data["cartao"]);
      } else {
        await meioPagamento.meioPagamentoToNull();
      }
    } catch (e) {
      print(e);
    } finally {
      setInformacaoCartao(true);
    }
  }
}
