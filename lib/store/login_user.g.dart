// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginUser on _LoginUserBase, Store {
  Computed<bool> _$validatePasswordComputed;

  @override
  bool get validatePassword => (_$validatePasswordComputed ??=
          Computed<bool>(() => super.validatePassword))
      .value;
  Computed<ESTADOPAGINAAOINICIARAPLICATIVO>
      _$verificarEstadoPaginaInicialComputed;

  @override
  ESTADOPAGINAAOINICIARAPLICATIVO get verificarEstadoPaginaInicial =>
      (_$verificarEstadoPaginaInicialComputed ??=
              Computed<ESTADOPAGINAAOINICIARAPLICATIVO>(
                  () => super.verificarEstadoPaginaInicial))
          .value;
  Computed<bool> _$logoutRealizadoUsuarioComputed;

  @override
  bool get logoutRealizadoUsuario => (_$logoutRealizadoUsuarioComputed ??=
          Computed<bool>(() => super.logoutRealizadoUsuario))
      .value;
  Computed<bool> _$inserirComputed;

  @override
  bool get inserir =>
      (_$inserirComputed ??= Computed<bool>(() => super.inserir)).value;
  Computed<bool> _$habilitarLoginComputed;

  @override
  bool get habilitarLogin =>
      (_$habilitarLoginComputed ??= Computed<bool>(() => super.habilitarLogin))
          .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$stateAtom = Atom(name: '_LoginUserBase.state');

  @override
  STATES get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(STATES value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$confPasswordAtom = Atom(name: '_LoginUserBase.confPassword');

  @override
  String get confPassword {
    _$confPasswordAtom.context.enforceReadPolicy(_$confPasswordAtom);
    _$confPasswordAtom.reportObserved();
    return super.confPassword;
  }

  @override
  set confPassword(String value) {
    _$confPasswordAtom.context.conditionallyRunInAction(() {
      super.confPassword = value;
      _$confPasswordAtom.reportChanged();
    }, _$confPasswordAtom, name: '${_$confPasswordAtom.name}_set');
  }

  final _$cadastrarLoadingAtom = Atom(name: '_LoginUserBase.cadastrarLoading');

  @override
  bool get cadastrarLoading {
    _$cadastrarLoadingAtom.context.enforceReadPolicy(_$cadastrarLoadingAtom);
    _$cadastrarLoadingAtom.reportObserved();
    return super.cadastrarLoading;
  }

  @override
  set cadastrarLoading(bool value) {
    _$cadastrarLoadingAtom.context.conditionallyRunInAction(() {
      super.cadastrarLoading = value;
      _$cadastrarLoadingAtom.reportChanged();
    }, _$cadastrarLoadingAtom, name: '${_$cadastrarLoadingAtom.name}_set');
  }

  final _$cadastroSucessAtom = Atom(name: '_LoginUserBase.cadastroSucess');

  @override
  bool get cadastroSucess {
    _$cadastroSucessAtom.context.enforceReadPolicy(_$cadastroSucessAtom);
    _$cadastroSucessAtom.reportObserved();
    return super.cadastroSucess;
  }

  @override
  set cadastroSucess(bool value) {
    _$cadastroSucessAtom.context.conditionallyRunInAction(() {
      super.cadastroSucess = value;
      _$cadastroSucessAtom.reportChanged();
    }, _$cadastroSucessAtom, name: '${_$cadastroSucessAtom.name}_set');
  }

  final _$cadastroCompletoConcluidoAtom =
      Atom(name: '_LoginUserBase.cadastroCompletoConcluido');

  @override
  bool get cadastroCompletoConcluido {
    _$cadastroCompletoConcluidoAtom.context
        .enforceReadPolicy(_$cadastroCompletoConcluidoAtom);
    _$cadastroCompletoConcluidoAtom.reportObserved();
    return super.cadastroCompletoConcluido;
  }

  @override
  set cadastroCompletoConcluido(bool value) {
    _$cadastroCompletoConcluidoAtom.context.conditionallyRunInAction(() {
      super.cadastroCompletoConcluido = value;
      _$cadastroCompletoConcluidoAtom.reportChanged();
    }, _$cadastroCompletoConcluidoAtom,
        name: '${_$cadastroCompletoConcluidoAtom.name}_set');
  }

  final _$cadastroconcluidoestadoAtom =
      Atom(name: '_LoginUserBase.cadastroconcluidoestado');

  @override
  CADASTROCONCLUIDOESTADO get cadastroconcluidoestado {
    _$cadastroconcluidoestadoAtom.context
        .enforceReadPolicy(_$cadastroconcluidoestadoAtom);
    _$cadastroconcluidoestadoAtom.reportObserved();
    return super.cadastroconcluidoestado;
  }

  @override
  set cadastroconcluidoestado(CADASTROCONCLUIDOESTADO value) {
    _$cadastroconcluidoestadoAtom.context.conditionallyRunInAction(() {
      super.cadastroconcluidoestado = value;
      _$cadastroconcluidoestadoAtom.reportChanged();
    }, _$cadastroconcluidoestadoAtom,
        name: '${_$cadastroconcluidoestadoAtom.name}_set');
  }

  final _$estadoPaginaAoIniciarAplicativoAtom =
      Atom(name: '_LoginUserBase.estadoPaginaAoIniciarAplicativo');

  @override
  ESTADOPAGINAAOINICIARAPLICATIVO get estadoPaginaAoIniciarAplicativo {
    _$estadoPaginaAoIniciarAplicativoAtom.context
        .enforceReadPolicy(_$estadoPaginaAoIniciarAplicativoAtom);
    _$estadoPaginaAoIniciarAplicativoAtom.reportObserved();
    return super.estadoPaginaAoIniciarAplicativo;
  }

  @override
  set estadoPaginaAoIniciarAplicativo(ESTADOPAGINAAOINICIARAPLICATIVO value) {
    _$estadoPaginaAoIniciarAplicativoAtom.context.conditionallyRunInAction(() {
      super.estadoPaginaAoIniciarAplicativo = value;
      _$estadoPaginaAoIniciarAplicativoAtom.reportChanged();
    }, _$estadoPaginaAoIniciarAplicativoAtom,
        name: '${_$estadoPaginaAoIniciarAplicativoAtom.name}_set');
  }

  final _$logoutRealizadoAtom = Atom(name: '_LoginUserBase.logoutRealizado');

  @override
  bool get logoutRealizado {
    _$logoutRealizadoAtom.context.enforceReadPolicy(_$logoutRealizadoAtom);
    _$logoutRealizadoAtom.reportObserved();
    return super.logoutRealizado;
  }

  @override
  set logoutRealizado(bool value) {
    _$logoutRealizadoAtom.context.conditionallyRunInAction(() {
      super.logoutRealizado = value;
      _$logoutRealizadoAtom.reportChanged();
    }, _$logoutRealizadoAtom, name: '${_$logoutRealizadoAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$verificarSeExisteUsuarioLogadoAsyncAction =
      AsyncAction('verificarSeExisteUsuarioLogado');

  @override
  Future<void> verificarSeExisteUsuarioLogado() {
    return _$verificarSeExisteUsuarioLogadoAsyncAction
        .run(() => super.verificarSeExisteUsuarioLogado());
  }

  final _$cadastrarUsuarioAsyncAction = AsyncAction('cadastrarUsuario');

  @override
  Future<dynamic> cadastrarUsuario() {
    return _$cadastrarUsuarioAsyncAction.run(() => super.cadastrarUsuario());
  }

  final _$completarDadosAsyncAction = AsyncAction('completarDados');

  @override
  Future completarDados() {
    return _$completarDadosAsyncAction.run(() => super.completarDados());
  }

  final _$_LoginUserBaseActionController =
      ActionController(name: '_LoginUserBase');

  @override
  dynamic changeConfPassword(String value) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.changeConfPassword(value);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCadastroConcluido(bool newCadastroCompletoConcluido) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.changeCadastroConcluido(newCadastroCompletoConcluido);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarEstadoCadastroConcluido(CADASTROCONCLUIDOESTADO estado) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.alterarEstadoCadastroConcluido(estado);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO novoEstado) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.alterarEstadoTelaInicial(novoEstado);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarEstadoPaginaLogin(STATES novoEstado) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.mudarEstadoPaginaLogin(novoEstado);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic realizarLogout(bool situacaoLogout) {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.realizarLogout(situacaoLogout);
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void zearVariaveis() {
    final _$actionInfo = _$_LoginUserBaseActionController.startAction();
    try {
      return super.zearVariaveis();
    } finally {
      _$_LoginUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'state: ${state.toString()},confPassword: ${confPassword.toString()},cadastrarLoading: ${cadastrarLoading.toString()},cadastroSucess: ${cadastroSucess.toString()},cadastroCompletoConcluido: ${cadastroCompletoConcluido.toString()},cadastroconcluidoestado: ${cadastroconcluidoestado.toString()},estadoPaginaAoIniciarAplicativo: ${estadoPaginaAoIniciarAplicativo.toString()},logoutRealizado: ${logoutRealizado.toString()},validatePassword: ${validatePassword.toString()},verificarEstadoPaginaInicial: ${verificarEstadoPaginaInicial.toString()},logoutRealizadoUsuario: ${logoutRealizadoUsuario.toString()},inserir: ${inserir.toString()},habilitarLogin: ${habilitarLogin.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
