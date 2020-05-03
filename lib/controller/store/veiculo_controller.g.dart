// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VeiculoController on _VeiculoControllerBase, Store {
  Computed<bool> _$getCadastrarVeiculoComputed;

  @override
  bool get getCadastrarVeiculo => (_$getCadastrarVeiculoComputed ??=
          Computed<bool>(() => super.getCadastrarVeiculo))
      .value;
  Computed<ESTADOVEICULOAOINSERIR> _$recuperarEstadoVeiculoAoInserirComputed;

  @override
  ESTADOVEICULOAOINSERIR get recuperarEstadoVeiculoAoInserir =>
      (_$recuperarEstadoVeiculoAoInserirComputed ??=
              Computed<ESTADOVEICULOAOINSERIR>(
                  () => super.recuperarEstadoVeiculoAoInserir))
          .value;

  final _$cadastrarVeiculoAtom =
      Atom(name: '_VeiculoControllerBase.cadastrarVeiculo');

  @override
  bool get cadastrarVeiculo {
    _$cadastrarVeiculoAtom.context.enforceReadPolicy(_$cadastrarVeiculoAtom);
    _$cadastrarVeiculoAtom.reportObserved();
    return super.cadastrarVeiculo;
  }

  @override
  set cadastrarVeiculo(bool value) {
    _$cadastrarVeiculoAtom.context.conditionallyRunInAction(() {
      super.cadastrarVeiculo = value;
      _$cadastrarVeiculoAtom.reportChanged();
    }, _$cadastrarVeiculoAtom, name: '${_$cadastrarVeiculoAtom.name}_set');
  }

  final _$estadoVeiculoAoInserirAtom =
      Atom(name: '_VeiculoControllerBase.estadoVeiculoAoInserir');

  @override
  ESTADOVEICULOAOINSERIR get estadoVeiculoAoInserir {
    _$estadoVeiculoAoInserirAtom.context
        .enforceReadPolicy(_$estadoVeiculoAoInserirAtom);
    _$estadoVeiculoAoInserirAtom.reportObserved();
    return super.estadoVeiculoAoInserir;
  }

  @override
  set estadoVeiculoAoInserir(ESTADOVEICULOAOINSERIR value) {
    _$estadoVeiculoAoInserirAtom.context.conditionallyRunInAction(() {
      super.estadoVeiculoAoInserir = value;
      _$estadoVeiculoAoInserirAtom.reportChanged();
    }, _$estadoVeiculoAoInserirAtom,
        name: '${_$estadoVeiculoAoInserirAtom.name}_set');
  }

  final _$_VeiculoControllerBaseActionController =
      ActionController(name: '_VeiculoControllerBase');

  @override
  dynamic setCadastrarVeiculo(bool cadastrar) {
    final _$actionInfo = _$_VeiculoControllerBaseActionController.startAction();
    try {
      return super.setCadastrarVeiculo(cadastrar);
    } finally {
      _$_VeiculoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAlterarEstadoVeiculoAoInserir(ESTADOVEICULOAOINSERIR novoEstado) {
    final _$actionInfo = _$_VeiculoControllerBaseActionController.startAction();
    try {
      return super.setAlterarEstadoVeiculoAoInserir(novoEstado);
    } finally {
      _$_VeiculoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cadastrarVeiculo: ${cadastrarVeiculo.toString()},estadoVeiculoAoInserir: ${estadoVeiculoAoInserir.toString()},getCadastrarVeiculo: ${getCadastrarVeiculo.toString()},recuperarEstadoVeiculoAoInserir: ${recuperarEstadoVeiculoAoInserir.toString()}';
    return '{$string}';
  }
}
