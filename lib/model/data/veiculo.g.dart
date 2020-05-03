// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Veiculos on _VeiculosBase, Store {
  Computed<bool> _$verificarPlacaComputed;

  @override
  bool get verificarPlaca =>
      (_$verificarPlacaComputed ??= Computed<bool>(() => super.verificarPlaca))
          .value;

  final _$uidAtom = Atom(name: '_VeiculosBase.uid');

  @override
  String get uid {
    _$uidAtom.context.enforceReadPolicy(_$uidAtom);
    _$uidAtom.reportObserved();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.context.conditionallyRunInAction(() {
      super.uid = value;
      _$uidAtom.reportChanged();
    }, _$uidAtom, name: '${_$uidAtom.name}_set');
  }

  final _$placaAtom = Atom(name: '_VeiculosBase.placa');

  @override
  String get placa {
    _$placaAtom.context.enforceReadPolicy(_$placaAtom);
    _$placaAtom.reportObserved();
    return super.placa;
  }

  @override
  set placa(String value) {
    _$placaAtom.context.conditionallyRunInAction(() {
      super.placa = value;
      _$placaAtom.reportChanged();
    }, _$placaAtom, name: '${_$placaAtom.name}_set');
  }

  final _$modeloAtom = Atom(name: '_VeiculosBase.modelo');

  @override
  String get modelo {
    _$modeloAtom.context.enforceReadPolicy(_$modeloAtom);
    _$modeloAtom.reportObserved();
    return super.modelo;
  }

  @override
  set modelo(String value) {
    _$modeloAtom.context.conditionallyRunInAction(() {
      super.modelo = value;
      _$modeloAtom.reportChanged();
    }, _$modeloAtom, name: '${_$modeloAtom.name}_set');
  }

  final _$fabricanteAtom = Atom(name: '_VeiculosBase.fabricante');

  @override
  String get fabricante {
    _$fabricanteAtom.context.enforceReadPolicy(_$fabricanteAtom);
    _$fabricanteAtom.reportObserved();
    return super.fabricante;
  }

  @override
  set fabricante(String value) {
    _$fabricanteAtom.context.conditionallyRunInAction(() {
      super.fabricante = value;
      _$fabricanteAtom.reportChanged();
    }, _$fabricanteAtom, name: '${_$fabricanteAtom.name}_set');
  }

  final _$anoFabricacaoAtom = Atom(name: '_VeiculosBase.anoFabricacao');

  @override
  String get anoFabricacao {
    _$anoFabricacaoAtom.context.enforceReadPolicy(_$anoFabricacaoAtom);
    _$anoFabricacaoAtom.reportObserved();
    return super.anoFabricacao;
  }

  @override
  set anoFabricacao(String value) {
    _$anoFabricacaoAtom.context.conditionallyRunInAction(() {
      super.anoFabricacao = value;
      _$anoFabricacaoAtom.reportChanged();
    }, _$anoFabricacaoAtom, name: '${_$anoFabricacaoAtom.name}_set');
  }

  final _$_VeiculosBaseActionController =
      ActionController(name: '_VeiculosBase');

  @override
  dynamic setUid(String newUid) {
    final _$actionInfo = _$_VeiculosBaseActionController.startAction();
    try {
      return super.setUid(newUid);
    } finally {
      _$_VeiculosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlaca(String novaPlaca) {
    final _$actionInfo = _$_VeiculosBaseActionController.startAction();
    try {
      return super.setPlaca(novaPlaca);
    } finally {
      _$_VeiculosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModelo(String novoModelo) {
    final _$actionInfo = _$_VeiculosBaseActionController.startAction();
    try {
      return super.setModelo(novoModelo);
    } finally {
      _$_VeiculosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFabricante(String novoFabricante) {
    final _$actionInfo = _$_VeiculosBaseActionController.startAction();
    try {
      return super.setFabricante(novoFabricante);
    } finally {
      _$_VeiculosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAnoFabricacao(String novoAnoFabricacao) {
    final _$actionInfo = _$_VeiculosBaseActionController.startAction();
    try {
      return super.setAnoFabricacao(novoAnoFabricacao);
    } finally {
      _$_VeiculosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'uid: ${uid.toString()},placa: ${placa.toString()},modelo: ${modelo.toString()},fabricante: ${fabricante.toString()},anoFabricacao: ${anoFabricacao.toString()},verificarPlaca: ${verificarPlaca.toString()}';
    return '{$string}';
  }
}
