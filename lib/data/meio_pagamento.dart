import 'package:mobx/mobx.dart';
part 'meio_pagamento.g.dart';

class MeioPagamento = _MeioPagamentoBase with _$MeioPagamento;

abstract class _MeioPagamentoBase with Store {

  @observable
  String cardNumber = "";

  @action
  setNumeroCartao(String numeroCartao) => cardNumber = numeroCartao;

  @computed
  String get getNumeroCartao {
    return cardNumber;
  } 
  
  @observable
  String cardHolderName = "";
  

  @action
  setCardHolderName(String novoCardoHolderName) => cardHolderName = novoCardoHolderName;

  @computed 
  String get getCardHolderName {
    return cardHolderName;
  }

  @observable
  String expiryDate = "";
  
  @action 
  setExpiryDate(String novoExperityDate) => expiryDate = novoExperityDate;

  @computed
  String get getNovoExperityDate {
    return expiryDate;
  }

  @observable
  String cvv = "";
  
  @action 
  setCVV(String novoCVV) => cvv = novoCVV;

  @computed 
  String get getCVV {
    return cvv;
  }

  @observable
  bool showBack = false;

  @action  
  setShowBack(bool novoShowBack) => showBack = novoShowBack;

  @computed 
  bool get getShowBack {
    return showBack;
  }
  
}