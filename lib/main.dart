
import 'package:feira/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controller/store/cartoes.dart';
import 'controller/store/login_user.dart';

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

