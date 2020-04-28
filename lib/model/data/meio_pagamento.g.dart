// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meio_pagamento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeioPagamento on _MeioPagamentoBase, Store {
  Computed<String> _$getNumeroCartaoComputed;

  @override
  String get getNumeroCartao => (_$getNumeroCartaoComputed ??=
          Computed<String>(() => super.getNumeroCartao))
      .value;
  Computed<String> _$getCardHolderNameComputed;

  @override
  String get getCardHolderName => (_$getCardHolderNameComputed ??=
          Computed<String>(() => super.getCardHolderName))
      .value;
  Computed<String> _$getNovoExperityDateComputed;

  @override
  String get getNovoExperityDate => (_$getNovoExperityDateComputed ??=
          Computed<String>(() => super.getNovoExperityDate))
      .value;
  Computed<String> _$getCVVComputed;

  @override
  String get getCVV =>
      (_$getCVVComputed ??= Computed<String>(() => super.getCVV)).value;
  Computed<bool> _$getShowBackComputed;

  @override
  bool get getShowBack =>
      (_$getShowBackComputed ??= Computed<bool>(() => super.getShowBack)).value;

  final _$cardNumberAtom = Atom(name: '_MeioPagamentoBase.cardNumber');

  @override
  String get cardNumber {
    _$cardNumberAtom.context.enforceReadPolicy(_$cardNumberAtom);
    _$cardNumberAtom.reportObserved();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.context.conditionallyRunInAction(() {
      super.cardNumber = value;
      _$cardNumberAtom.reportChanged();
    }, _$cardNumberAtom, name: '${_$cardNumberAtom.name}_set');
  }

  final _$cardHolderNameAtom = Atom(name: '_MeioPagamentoBase.cardHolderName');

  @override
  String get cardHolderName {
    _$cardHolderNameAtom.context.enforceReadPolicy(_$cardHolderNameAtom);
    _$cardHolderNameAtom.reportObserved();
    return super.cardHolderName;
  }

  @override
  set cardHolderName(String value) {
    _$cardHolderNameAtom.context.conditionallyRunInAction(() {
      super.cardHolderName = value;
      _$cardHolderNameAtom.reportChanged();
    }, _$cardHolderNameAtom, name: '${_$cardHolderNameAtom.name}_set');
  }

  final _$expiryDateAtom = Atom(name: '_MeioPagamentoBase.expiryDate');

  @override
  String get expiryDate {
    _$expiryDateAtom.context.enforceReadPolicy(_$expiryDateAtom);
    _$expiryDateAtom.reportObserved();
    return super.expiryDate;
  }

  @override
  set expiryDate(String value) {
    _$expiryDateAtom.context.conditionallyRunInAction(() {
      super.expiryDate = value;
      _$expiryDateAtom.reportChanged();
    }, _$expiryDateAtom, name: '${_$expiryDateAtom.name}_set');
  }

  final _$cvvAtom = Atom(name: '_MeioPagamentoBase.cvv');

  @override
  String get cvv {
    _$cvvAtom.context.enforceReadPolicy(_$cvvAtom);
    _$cvvAtom.reportObserved();
    return super.cvv;
  }

  @override
  set cvv(String value) {
    _$cvvAtom.context.conditionallyRunInAction(() {
      super.cvv = value;
      _$cvvAtom.reportChanged();
    }, _$cvvAtom, name: '${_$cvvAtom.name}_set');
  }

  final _$showBackAtom = Atom(name: '_MeioPagamentoBase.showBack');

  @override
  bool get showBack {
    _$showBackAtom.context.enforceReadPolicy(_$showBackAtom);
    _$showBackAtom.reportObserved();
    return super.showBack;
  }

  @override
  set showBack(bool value) {
    _$showBackAtom.context.conditionallyRunInAction(() {
      super.showBack = value;
      _$showBackAtom.reportChanged();
    }, _$showBackAtom, name: '${_$showBackAtom.name}_set');
  }

  final _$_MeioPagamentoBaseActionController =
      ActionController(name: '_MeioPagamentoBase');

  @override
  dynamic setNumeroCartao(String numeroCartao) {
    final _$actionInfo = _$_MeioPagamentoBaseActionController.startAction();
    try {
      return super.setNumeroCartao(numeroCartao);
    } finally {
      _$_MeioPagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardHolderName(String novoCardoHolderName) {
    final _$actionInfo = _$_MeioPagamentoBaseActionController.startAction();
    try {
      return super.setCardHolderName(novoCardoHolderName);
    } finally {
      _$_MeioPagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExpiryDate(String novoExperityDate) {
    final _$actionInfo = _$_MeioPagamentoBaseActionController.startAction();
    try {
      return super.setExpiryDate(novoExperityDate);
    } finally {
      _$_MeioPagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCVV(String novoCVV) {
    final _$actionInfo = _$_MeioPagamentoBaseActionController.startAction();
    try {
      return super.setCVV(novoCVV);
    } finally {
      _$_MeioPagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowBack(bool novoShowBack) {
    final _$actionInfo = _$_MeioPagamentoBaseActionController.startAction();
    try {
      return super.setShowBack(novoShowBack);
    } finally {
      _$_MeioPagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cardNumber: ${cardNumber.toString()},cardHolderName: ${cardHolderName.toString()},expiryDate: ${expiryDate.toString()},cvv: ${cvv.toString()},showBack: ${showBack.toString()},getNumeroCartao: ${getNumeroCartao.toString()},getCardHolderName: ${getCardHolderName.toString()},getNovoExperityDate: ${getNovoExperityDate.toString()},getCVV: ${getCVV.toString()},getShowBack: ${getShowBack.toString()}';
    return '{$string}';
  }
}
