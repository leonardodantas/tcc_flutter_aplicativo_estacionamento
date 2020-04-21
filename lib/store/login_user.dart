import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:feira/data/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
part 'login_user.g.dart';

enum STATES { IDEL, SUCCESS, FAIL }
enum CADASTROCONCLUIDOESTADO { IDEL, SUCCESS, FAIL }
enum ESTADOPAGINAAOINICIARAPLICATIVO {CARREGANDO, LOGADO, NAOLOGADO}

class LoginUser = _LoginUserBase with _$LoginUser;

abstract class _LoginUserBase with Store {
  var usuario = Usuario();

  FirebaseAuth _firebaseAuth;
  Firestore _firestore;

  @observable
  STATES state;

  @observable
  String confPassword;
  @action
  changeConfPassword(String value) => confPassword = value;

  @observable
  bool cadastrarLoading = false;

  @observable
  bool cadastroSucess;

  @computed
  bool get validatePassword {
    return usuario.password == confPassword;
  }

  @observable
  bool cadastroCompletoConcluido = false;

  @action
  changeCadastroConcluido(bool newCadastroCompletoConcluido) =>
      cadastroCompletoConcluido = newCadastroCompletoConcluido;

  @observable
  CADASTROCONCLUIDOESTADO cadastroconcluidoestado;

  @action
  alterarEstadoCadastroConcluido(CADASTROCONCLUIDOESTADO estado) =>
      cadastroconcluidoestado = estado;
    
  @observable 
  ESTADOPAGINAAOINICIARAPLICATIVO estadoPaginaAoIniciarAplicativo; 
  
  @action
  alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO novoEstado) => estadoPaginaAoIniciarAplicativo = novoEstado;

  @computed
  ESTADOPAGINAAOINICIARAPLICATIVO get verificarEstadoPaginaInicial {
    return estadoPaginaAoIniciarAplicativo;
  }
  
  @action
  Future login() async {
    _firebaseAuth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    cadastrarLoading = true;
    try {
      var auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.password);

      await recuperarTodosOsDadosDoUsuario(auth.user.uid);

      mudarEstadoPaginaLogin(STATES.SUCCESS);
    } catch (e) {
      mudarEstadoPaginaLogin(STATES.FAIL);
    }
  }

  @action
  mudarEstadoPaginaLogin(STATES novoEstado) {
    state = novoEstado;
    cadastrarLoading = false;
  }

  @observable 
  bool logoutRealizado = false;

  @action
  realizarLogout(bool situacaoLogout) => logoutRealizado = situacaoLogout;

  @computed
  bool get logoutRealizadoUsuario {
    return logoutRealizado;
  }

  @action
  logout() async {
    _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut();
    await realizarLogout(true);
    await realizarLogout(false);
    alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO.NAOLOGADO);
  }

  @action
  Future<void> verificarSeExisteUsuarioLogado() async {
    alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO.CARREGANDO);
    _firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();

    if(firebaseUser != null){
      await recuperarTodosOsDadosDoUsuario(firebaseUser.uid);
      alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO.LOGADO);
      print(estadoPaginaAoIniciarAplicativo);
    } else {
      alterarEstadoTelaInicial(ESTADOPAGINAAOINICIARAPLICATIVO.NAOLOGADO);
    }
    return firebaseUser != null;
  }

  Future<void> recuperarTodosOsDadosDoUsuario(String uid) async {
    _firestore = Firestore.instance;
    var dados = await _firestore.collection("users").document(uid).get();
    print('------------------------------');
    print(dados);
    usuario.toUser(dados, uid);
  }

  @action
  Future cadastrarUsuario() async {
    _firebaseAuth = FirebaseAuth.instance;
    _firestore = Firestore.instance;
    cadastrarLoading = true;

    await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.password)
        .then((user) {
      var uid = user.user.uid;
      var novoUsuario = usuario.toMap();
      cadastrarLoading = false;
      _firestore
          .collection("users")
          .document(uid)
          .setData(novoUsuario)
          .then((value) {
        state = STATES.SUCCESS;
      });
    }).catchError((e) {
      cadastrarLoading = false;
      state = STATES.FAIL;
    });
  }

  @action
  completarDados() async {
    _firestore = Firestore.instance;
    bool verificarDadosComplados;
    var completarDados = usuario.toMapComplete();

    verificarDadosComplados = await salvarDadosCompletosDoUsuario(
        _firestore, completarDados, usuario.id);

    await atualizarCadastroConcluido(_firestore, usuario.id)
        ? verificarDadosComplados = true
        : verificarDadosComplados = false;
    if (verificarDadosComplados) {
      alterarEstadoCadastroConcluido(CADASTROCONCLUIDOESTADO.SUCCESS);
      changeCadastroConcluido(true);
    } else
      alterarEstadoCadastroConcluido(CADASTROCONCLUIDOESTADO.FAIL);
  }

  Future<bool> salvarDadosCompletosDoUsuario(Firestore _firestore,
      Map<String, dynamic> completarDados, String uid) async {
    try {
      await _firestore
          .collection("users")
          .document(usuario.id)
          .collection("dados_completos")
          .add(completarDados);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> atualizarCadastroConcluido(
      Firestore _firestore, String uid) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .updateData({'cadastro_concluido': true});
      return true;
    } catch (e) {
      return false;
    }
  }

  @computed
  bool get inserir {
    return cadastrarLoading;
  }

  @action
  void zearVariaveis() {
    state = STATES.IDEL;
    usuario.name = null;
    usuario.email = null;
    usuario.password = null;
    confPassword = null;
  }

  //validações

  String validationEmailLogin() {
    if (usuario.email != null)
      return EmailValidator.validate(usuario.email)
          ? null
          : "Campo Obrigatorio";
    return null;
  }

  String validationPasswordLogin() {
    if (usuario.password != null)
      return isLength(usuario.password, 6) ? null : "Campo Obrigatorio";
    return null;
  }

  @computed
  bool get habilitarLogin =>
      (validationEmailLogin() == null && usuario.email != null) &&
      (validationPasswordLogin() == null && usuario.password != null);

  String validationEmail() {
    if (usuario.email != null)
      return EmailValidator.validate(usuario.email) ? null : "Email invalido";
    return null;
  }

  String validationName() {
    if (usuario.name != null)
      return isLength(usuario.name, 6, 20) ? null : "Min. 6 - Max. 20";

    return null;
  }

  String validationPassword() {
    RegExp reg =
        new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z$*&@#]{6,}$');
    String validacao =
        "Necessario numero, caixa alta e caixa baixa e min. de 6";
    if (usuario.password != null)
      return reg.hasMatch(usuario.password) ? null : validacao;
    return null;
  }

  String comparePassword() {
    if (confPassword != null)
      return confPassword == usuario.password
          ? null
          : "Senhas precisam ser iguais";
    return null;
  }

  @computed
  bool get isValid {
    return (validationPassword() == null && usuario.password != null) &&
        (validationName() == null && usuario.name != null) &&
        (comparePassword() == null && confPassword != null) &&
        (validationEmail() == null && usuario.email != null);
  }
}
