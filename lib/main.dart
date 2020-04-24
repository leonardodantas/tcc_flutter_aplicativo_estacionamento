import 'package:feira/screens/cadastro_completo_screen.dart';
import 'package:feira/screens/home_screen.dart';
import 'package:feira/screens/verificacao_screen.dart';
import 'package:feira/store/cartoes.dart';
import 'package:feira/store/login_user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<LoginUser>(LoginUser());
  getIt.registerSingleton<Cartoes>(Cartoes());

  runApp(MyApp());

} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

