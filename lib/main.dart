
//imports do flutter
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//imports do flame
import 'package:flame/util.dart';
import 'package:flutter/services.dart';

//meus imports
import 'controler/boxgame.dart';
import 'view/menu.dart';

void main() async { //função assíncrona

  Util flameUtil = Util();
  await flameUtil.fullScreen(); //Tela cheia
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);//define a rotação da tela

  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget); //rodo a aplicação
  flameUtil.addGestureRecognizer(tapper);//adiciono o evento

  runApp(MyApp()); //rodo a aplicação
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // O widget Scaffold define o layouta da home
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Menu()
    );
  }
}