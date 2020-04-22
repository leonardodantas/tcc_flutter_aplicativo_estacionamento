// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartoes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cartoes on _CartoesBase, Store {
  Computed<ESTADOTELADECOMPRA> _$verificarEstadoTelaDeCompraComputed;

  @override
  ESTADOTELADECOMPRA get verificarEstadoTelaDeCompra =>
      (_$verificarEstadoTelaDeCompraComputed ??= Computed<ESTADOTELADECOMPRA>(
              () => super.verificarEstadoTelaDeCompra))
          .value;

  final _$valorUnitarioAtom = Atom(name: '_CartoesBase.valorUnitario');

  @override
  double get valorUnitario {
    _$valorUnitarioAtom.context.enforceReadPolicy(_$valorUnitarioAtom);
    _$valorUnitarioAtom.reportObserved();
    return super.valorUnitario;
  }

  @override
  set valorUnitario(double value) {
    _$valorUnitarioAtom.context.conditionallyRunInAction(() {
      super.valorUnitario = value;
      _$valorUnitarioAtom.reportChanged();
    }, _$valorUnitarioAtom, name: '${_$valorUnitarioAtom.name}_set');
  }

  final _$valorTotalAtom = Atom(name: '_CartoesBase.valorTotal');

  @override
  double get valorTotal {
    _$valorTotalAtom.context.enforceReadPolicy(_$valorTotalAtom);
    _$valorTotalAtom.reportObserved();
    return super.valorTotal;
  }

  @override
  set valorTotal(double value) {
    _$valorTotalAtom.context.conditionallyRunInAction(() {
      super.valorTotal = value;
      _$valorTotalAtom.reportChanged();
    }, _$valorTotalAtom, name: '${_$valorTotalAtom.name}_set');
  }

  final _$cartaoSelecionadoAtom = Atom(name: '_CartoesBase.cartaoSelecionado');

  @override
  String get cartaoSelecionado {
    _$cartaoSelecionadoAtom.context.enforceReadPolicy(_$cartaoSelecionadoAtom);
    _$cartaoSelecionadoAtom.reportObserved();
    return super.cartaoSelecionado;
  }

  @override
  set cartaoSelecionado(String value) {
    _$cartaoSelecionadoAtom.context.conditionallyRunInAction(() {
      super.cartaoSelecionado = value;
      _$cartaoSelecionadoAtom.reportChanged();
    }, _$cartaoSelecionadoAtom, name: '${_$cartaoSelecionadoAtom.name}_set');
  }

  final _$estadoteladecompraAtom =
      Atom(name: '_CartoesBase.estadoteladecompra');

  @override
  ESTADOTELADECOMPRA get estadoteladecompra {
    _$estadoteladecompraAtom.context
        .enforceReadPolicy(_$estadoteladecompraAtom);
    _$estadoteladecompraAtom.reportObserved();
    return super.estadoteladecompra;
  }

  @override
  set estadoteladecompra(ESTADOTELADECOMPRA value) {
    _$estadoteladecompraAtom.context.conditionallyRunInAction(() {
      super.estadoteladecompra = value;
      _$estadoteladecompraAtom.reportChanged();
    }, _$estadoteladecompraAtom, name: '${_$estadoteladecompraAtom.name}_set');
  }

  final _$_CartoesBaseActionController = ActionController(name: '_CartoesBase');

  @override
  dynamic escolherCartao(dynamic value) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.escolherCartao(value);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'valorUnitario: ${valorUnitario.toString()},valorTotal: ${valorTotal.toString()},cartaoSelecionado: ${cartaoSelecionado.toString()},estadoteladecompra: ${estadoteladecompra.toString()},verificarEstadoTelaDeCompra: ${verificarEstadoTelaDeCompra.toString()}';
    return '{$string}';
  }
}
