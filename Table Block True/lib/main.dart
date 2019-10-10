//imports do flutter
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/view/login.dart';

//meus imports
import 'view/menu.dart';
import 'package:tableblocktrue/view/entrada.dart';

void main() async {
  // carrega as imagens em cache
  Flame.images.loadAll(<String>[
    "sprite/bege_padrao.png",
    "sprite/bege_direita1.png",
    "sprite/bege_direita2.png",
    "icons/atencao.png",
    "icons/voltar.png",
    "joystick_background.png",
    "joystick_knob.png"
  ]);

  runApp(MyApp()); //rodo a aplicação
}

class MyApp extends StatelessWidget {

  Menu menu;
  Login login;

  MyApp(){
    menu = Menu();
    login = Login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // O widget Scaffold define o layouta da home
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Special", //define a fonte familia do texto
            textTheme: TextTheme(
              body1: TextStyle(
                  color: Colors.white,
                  fontSize: 19), //define a cor padrão dos textos
            )),
        home: Entrada(),
        routes: {
          '/Menu': (BuildContext context) => menu,
          '/Login': (BuildContext context) => login,
        });
  }
}
