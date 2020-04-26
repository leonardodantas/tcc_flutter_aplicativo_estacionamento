// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartoes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cartoes on _CartoesBase, Store {
  Computed<dynamic> _$quantidadeDeCartoesDoUsuarioComputed;

  @override
  dynamic get quantidadeDeCartoesDoUsuario =>
      (_$quantidadeDeCartoesDoUsuarioComputed ??=
              Computed<dynamic>(() => super.quantidadeDeCartoesDoUsuario))
          .value;
  Computed<ESTADOCARREGANDOQUANTIDADECARTOES>
      _$estadocarreadoquantidadecartoesComputed;

  @override
  ESTADOCARREGANDOQUANTIDADECARTOES get estadocarreadoquantidadecartoes =>
      (_$estadocarreadoquantidadecartoesComputed ??=
              Computed<ESTADOCARREGANDOQUANTIDADECARTOES>(
                  () => super.estadocarreadoquantidadecartoes))
          .value;
  Computed<ESTADOTELADECOMPRA> _$verificarEstadoTelaDeCompraComputed;

  @override
  ESTADOTELADECOMPRA get verificarEstadoTelaDeCompra =>
      (_$verificarEstadoTelaDeCompraComputed ??= Computed<ESTADOTELADECOMPRA>(
              () => super.verificarEstadoTelaDeCompra))
          .value;
  Computed<bool> _$retornarComprarRealizadaSucessoComputed;

  @override
  bool get retornarComprarRealizadaSucesso =>
      (_$retornarComprarRealizadaSucessoComputed ??=
              Computed<bool>(() => super.retornarComprarRealizadaSucesso))
          .value;
  Computed<ESTADOCOMPRA> _$retornarEstadoCompraComputed;

  @override
  ESTADOCOMPRA get retornarEstadoCompra => (_$retornarEstadoCompraComputed ??=
          Computed<ESTADOCOMPRA>(() => super.retornarEstadoCompra))
      .value;
  Computed<bool> _$getVerificarCadastrandoNovoCartaoComputed;

  @override
  bool get getVerificarCadastrandoNovoCartao =>
      (_$getVerificarCadastrandoNovoCartaoComputed ??=
              Computed<bool>(() => super.getVerificarCadastrandoNovoCartao))
          .value;
  Computed<ESTADOATUALIZARCARTAO> _$getEstadoAoAtualizarCartaoComputed;

  @override
  ESTADOATUALIZARCARTAO get getEstadoAoAtualizarCartao =>
      (_$getEstadoAoAtualizarCartaoComputed ??= Computed<ESTADOATUALIZARCARTAO>(
              () => super.getEstadoAoAtualizarCartao))
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

  final _$qtdCartoesUsuarioAtom = Atom(name: '_CartoesBase.qtdCartoesUsuario');

  @override
  double get qtdCartoesUsuario {
    _$qtdCartoesUsuarioAtom.context.enforceReadPolicy(_$qtdCartoesUsuarioAtom);
    _$qtdCartoesUsuarioAtom.reportObserved();
    return super.qtdCartoesUsuario;
  }

  @override
  set qtdCartoesUsuario(double value) {
    _$qtdCartoesUsuarioAtom.context.conditionallyRunInAction(() {
      super.qtdCartoesUsuario = value;
      _$qtdCartoesUsuarioAtom.reportChanged();
    }, _$qtdCartoesUsuarioAtom, name: '${_$qtdCartoesUsuarioAtom.name}_set');
  }

  final _$_estadocarregandoquantidadecartoesAtom =
      Atom(name: '_CartoesBase._estadocarregandoquantidadecartoes');

  @override
  ESTADOCARREGANDOQUANTIDADECARTOES get _estadocarregandoquantidadecartoes {
    _$_estadocarregandoquantidadecartoesAtom.context
        .enforceReadPolicy(_$_estadocarregandoquantidadecartoesAtom);
    _$_estadocarregandoquantidadecartoesAtom.reportObserved();
    return super._estadocarregandoquantidadecartoes;
  }

  @override
  set _estadocarregandoquantidadecartoes(
      ESTADOCARREGANDOQUANTIDADECARTOES value) {
    _$_estadocarregandoquantidadecartoesAtom.context.conditionallyRunInAction(
        () {
      super._estadocarregandoquantidadecartoes = value;
      _$_estadocarregandoquantidadecartoesAtom.reportChanged();
    }, _$_estadocarregandoquantidadecartoesAtom,
        name: '${_$_estadocarregandoquantidadecartoesAtom.name}_set');
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

  final _$compraRealizadaSucessoAtom =
      Atom(name: '_CartoesBase.compraRealizadaSucesso');

  @override
  bool get compraRealizadaSucesso {
    _$compraRealizadaSucessoAtom.context
        .enforceReadPolicy(_$compraRealizadaSucessoAtom);
    _$compraRealizadaSucessoAtom.reportObserved();
    return super.compraRealizadaSucesso;
  }

  @override
  set compraRealizadaSucesso(bool value) {
    _$compraRealizadaSucessoAtom.context.conditionallyRunInAction(() {
      super.compraRealizadaSucesso = value;
      _$compraRealizadaSucessoAtom.reportChanged();
    }, _$compraRealizadaSucessoAtom,
        name: '${_$compraRealizadaSucessoAtom.name}_set');
  }

  final _$estadoCompraAtom = Atom(name: '_CartoesBase.estadoCompra');

  @override
  ESTADOCOMPRA get estadoCompra {
    _$estadoCompraAtom.context.enforceReadPolicy(_$estadoCompraAtom);
    _$estadoCompraAtom.reportObserved();
    return super.estadoCompra;
  }

  @override
  set estadoCompra(ESTADOCOMPRA value) {
    _$estadoCompraAtom.context.conditionallyRunInAction(() {
      super.estadoCompra = value;
      _$estadoCompraAtom.reportChanged();
    }, _$estadoCompraAtom, name: '${_$estadoCompraAtom.name}_set');
  }

  final _$cadastrarNovoCartaoAtom =
      Atom(name: '_CartoesBase.cadastrarNovoCartao');

  @override
  bool get cadastrarNovoCartao {
    _$cadastrarNovoCartaoAtom.context
        .enforceReadPolicy(_$cadastrarNovoCartaoAtom);
    _$cadastrarNovoCartaoAtom.reportObserved();
    return super.cadastrarNovoCartao;
  }

  @override
  set cadastrarNovoCartao(bool value) {
    _$cadastrarNovoCartaoAtom.context.conditionallyRunInAction(() {
      super.cadastrarNovoCartao = value;
      _$cadastrarNovoCartaoAtom.reportChanged();
    }, _$cadastrarNovoCartaoAtom,
        name: '${_$cadastrarNovoCartaoAtom.name}_set');
  }

  final _$estadoatualizarcartaoAtom =
      Atom(name: '_CartoesBase.estadoatualizarcartao');

  @override
  ESTADOATUALIZARCARTAO get estadoatualizarcartao {
    _$estadoatualizarcartaoAtom.context
        .enforceReadPolicy(_$estadoatualizarcartaoAtom);
    _$estadoatualizarcartaoAtom.reportObserved();
    return super.estadoatualizarcartao;
  }

  @override
  set estadoatualizarcartao(ESTADOATUALIZARCARTAO value) {
    _$estadoatualizarcartaoAtom.context.conditionallyRunInAction(() {
      super.estadoatualizarcartao = value;
      _$estadoatualizarcartaoAtom.reportChanged();
    }, _$estadoatualizarcartaoAtom,
        name: '${_$estadoatualizarcartaoAtom.name}_set');
  }

  final _$verificarQuantidadeDeCartoesUsuarioAsyncAction =
      AsyncAction('verificarQuantidadeDeCartoesUsuario');

  @override
  Future verificarQuantidadeDeCartoesUsuario() {
    return _$verificarQuantidadeDeCartoesUsuarioAsyncAction
        .run(() => super.verificarQuantidadeDeCartoesUsuario());
  }

  final _$realizarCompraCartaoAsyncAction = AsyncAction('realizarCompraCartao');

  @override
  Future realizarCompraCartao() {
    return _$realizarCompraCartaoAsyncAction
        .run(() => super.realizarCompraCartao());
  }

  final _$_CartoesBaseActionController = ActionController(name: '_CartoesBase');

  @override
  dynamic alterarQuantidadeCartoesUsuario(double novaQuantidade) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.alterarQuantidadeCartoesUsuario(novaQuantidade);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarEstadoCarregandoQuantidadeCartoes(
      ESTADOCARREGANDOQUANTIDADECARTOES novoEstado) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.alterarEstadoCarregandoQuantidadeCartoes(novoEstado);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic alterarEstadoDeCompra(ESTADOCOMPRA novoEstadoDeCompra) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.alterarEstadoDeCompra(novoEstadoDeCompra);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCadastrarNovoCartao(bool novoCartao) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.setCadastrarNovoCartao(novoCartao);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEstadoAtualizarCartao(ESTADOATUALIZARCARTAO estado) {
    final _$actionInfo = _$_CartoesBaseActionController.startAction();
    try {
      return super.setEstadoAtualizarCartao(estado);
    } finally {
      _$_CartoesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'valorUnitario: ${valorUnitario.toString()},valorTotal: ${valorTotal.toString()},cartaoSelecionado: ${cartaoSelecionado.toString()},qtdCartoesUsuario: ${qtdCartoesUsuario.toString()},estadoteladecompra: ${estadoteladecompra.toString()},compraRealizadaSucesso: ${compraRealizadaSucesso.toString()},estadoCompra: ${estadoCompra.toString()},cadastrarNovoCartao: ${cadastrarNovoCartao.toString()},estadoatualizarcartao: ${estadoatualizarcartao.toString()},quantidadeDeCartoesDoUsuario: ${quantidadeDeCartoesDoUsuario.toString()},estadocarreadoquantidadecartoes: ${estadocarreadoquantidadecartoes.toString()},verificarEstadoTelaDeCompra: ${verificarEstadoTelaDeCompra.toString()},retornarComprarRealizadaSucesso: ${retornarComprarRealizadaSucesso.toString()},retornarEstadoCompra: ${retornarEstadoCompra.toString()},getVerificarCadastrandoNovoCartao: ${getVerificarCadastrandoNovoCartao.toString()},getEstadoAoAtualizarCartao: ${getEstadoAoAtualizarCartao.toString()}';
    return '{$string}';
  }
}
