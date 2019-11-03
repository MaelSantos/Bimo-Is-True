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
    "sprite/play_0.png",
    "sprite/play_1.png",
    "sprite/play_2.png",
    "sprite/play_3.png",
    "sprite/play_4.png",
    "sprite/play_5.png",
    "icons/atencao.png",
    "icons/voltar.png",
    "icons/segurar.png",
    "icons/soltar.png",
    "joystick_background.png",
    "joystick_knob.png",
    "bloco.png"
  ]);

  runApp(MyApp()); //rodo a aplicação
}

class MyApp extends StatelessWidget {
  Menu menu;
  Login login;

  MyApp() {
    menu = Menu();
    login = Login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // O widget Scaffold define o layouta da home
        theme: ThemeData(
            backgroundColor: Color(0xff269fbd),
            buttonColor: Colors.green,
            scaffoldBackgroundColor: Color(0xff269fbd),
            sliderTheme: SliderThemeData(
                activeTickMarkColor: Colors.green,
                valueIndicatorTextStyle: TextStyle(color: Colors.green, fontFamily: "Special")),
            fontFamily: "Special", //define a fonte familia do texto
            textTheme: TextTheme(
              //define a cor padrão dos textos
              body1: TextStyle(color: Colors.white, fontSize: 19),
              body2: TextStyle(color: Colors.white, fontSize: 19),
            )),
        home: Entrada(),
        routes: {
          '/Menu': (BuildContext context) => menu,
          '/Login': (BuildContext context) => login,
        });
  }
}
