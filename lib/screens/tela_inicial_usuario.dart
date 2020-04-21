import 'package:feira/screens/comprar_cartoes_screen.dart';
import 'package:feira/screens/home_screen.dart';
import 'package:feira/screens/tabs_usuario/inicio_usuario.dart';
import 'package:feira/store/login_user.dart';
import 'package:feira/widgets/custom_drawer.dart';
import 'package:feira/widgets/tiles/floating_action_comprar_cartao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class TelaInicialUsuarioScreen extends StatefulWidget {
  @override
  _TelaInicialUsuarioScreenState createState() =>
      _TelaInicialUsuarioScreenState();
}

class _TelaInicialUsuarioScreenState extends State<TelaInicialUsuarioScreen> {
  final List<ReactionDisposer> _disposers = [];
  final _pageCotroller = PageController();
  final _loginUser = GetIt.I.get<LoginUser>();

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers.add(autorun((_) {
      if (_loginUser.logoutRealizadoUsuario)
        Navigator.of(context).popUntil((route) => route.isFirst);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageCotroller,
      //physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Inicio"),
            centerTitle: true,
          ),
          body: InicioUsuarioTab(),
          drawer: CustomDrawer(_pageCotroller),
          floatingActionButton:FloatingActionComprarCartao(onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => ComprarCartoesScreen()));
          },)
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Cupons"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageCotroller),
          body: Container(color: Colors.red),
        ),
        Scaffold(
            appBar: AppBar(
              title: Text("Automoveis"),
              centerTitle: true,
            ),
            body: Container(color: Colors.green),
            drawer: CustomDrawer(_pageCotroller)),
        Scaffold(
            appBar: AppBar(
              title: Text("Configurações"),
              centerTitle: true,
            ),
            body: Container(color: Colors.green),
            drawer: CustomDrawer(_pageCotroller)),
      ],
    );
  }
}
