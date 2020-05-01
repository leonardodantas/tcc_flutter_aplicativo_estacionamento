import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {
  @observable
  String id;

  @observable
  bool cadastroConcluido;

  @action
  changeCadastro(bool newCadastroConcluido) =>
      cadastroConcluido = newCadastroConcluido;

  @observable
  String name;
  @action
  changeName(String newName) => name = newName;

  @observable
  String email;
  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  String password;
  @action
  changePassword(String newPassword) => password = newPassword;

  @observable
  String profissao;
  @action
  changeProfissao(String newProfissao) => profissao = newProfissao;

  @observable
  String cpf;
  @action
  changeCPF(String newCPF) => cpf = newCPF;

  @observable
  String data;
  @action
  changeData(String newData) => data = newData;

  @observable
  String renda;
  @action
  changeRenda(String newRenda) => renda = newRenda;

  @observable
  String cep;
  changeCep(String newCep) => cep = newCep;

  @observable
  String celular;
  @action
  changeCelular(String newCelular) => celular = newCelular;

  @observable
  String sexo;
  @action
  changeSexo(String newSexo) => sexo = newSexo;

  @observable
  bool emailVerificado;
  @action
  changeEmailVerificado(bool verificado) => emailVerificado = verificado;
  @computed
  bool get verificarEmailVerificado {
    return emailVerificado;
  }

  String siglaNomeUsuario;

  Map<String, dynamic> toMap() {
    return {'name': name.trim(), 'email': email, 'cadastro_concluido': false};
  }

  void toUser(DocumentSnapshot document, String uid) {
    id = uid;
    name = document["name"];
    email = document["email"];
    cadastroConcluido = document["cadastro_concluido"];
    criarSiglaParaOUsuario();
  }

  void criarSiglaParaOUsuario() {
    List<String> nomeDividido = name.split(' ');
    String siglaNome = '';
    nomeDividido.forEach((n) => siglaNome += n.toUpperCase().substring(0, 1));
    siglaNomeUsuario = siglaNome.substring(0, 1) + siglaNome.substring(1, 2);
  }

  Map<String, dynamic> toMapComplete() {
    return {
      'profissao': profissao,
      'cpf': cpf,
      'data': data,
      'renda': renda,
      'sexo': sexo,
      'celular': celular,
      'cep': cep,
    };
  }
}
