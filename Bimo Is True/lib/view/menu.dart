import 'package:firebase_admob/firebase_admob.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bimo_is_true/controller/game.dart';
import 'package:bimo_is_true/util/faseUtil.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/ajuda.dart';
import 'package:bimo_is_true/view/alerta.dart';

import 'package:bimo_is_true/view/config.dart';
import 'package:bimo_is_true/view/fase.dart';
import 'package:bimo_is_true/view/info.dart';
import 'package:bimo_is_true/view/principal.dart';

import '../util/propaganda.dart';
import '../util/propaganda.dart';

class Menu extends StatefulWidget {
  MenuState menuState;

  @override
  State<StatefulWidget> createState() {
    menuState = MenuState();
    return menuState;
  }
}

class MenuState extends State<Menu> {
  //variaveis
  Tela tela;
  String titulo;
  //telas
  Scaffold gestureGame;
  BoxGame game;
  Util flameUtil;

  Principal principal;
  Fase fase;
  Config config;
  Ajuda ajuda;
  Info info;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    //função assíncrona
    titulo = "Table Block True";
    tela = Tela.login;
    //telas de suporte
    principal = Principal(this);
    fase = Fase(this);
    config = Config(this);
    ajuda = Ajuda(this);
    info = Info(this);
    //tela jogo
    // game = BoxGame(this);
    flameUtil = Util();

    // game = BoxGame(this);
    // TapGestureRecognizer tapper = TapGestureRecognizer();
    // // tapper.onTapDown = game.onTapDown;
    // tapper.onTapUp = game.onTapUp;
    // flameUtil.addGestureRecognizer(tapper); //adiciono o evento

    // gestureGame = Scaffold(
    //     body: GestureDetector(
    //   behavior: HitTestBehavior.opaque,
    //   onPanStart: game.onPanStart,
    //   onPanUpdate: game.onPanUpdate,
    //   onPanEnd: game.onPanEnd,
    //   child: game.widget,
    // ));

    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-4785348218475505~5161848991");
  }

  @override
  void dispose() {
    Propaganda.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return principal;
  }

  //faz a mudança das telas
  void mudarTela() {
    switch (tela.index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/Login');
        break;
      case 2:
        Navigator.pop(context);
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => fase));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => gameInit()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => config));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ajuda));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => info));
        break;
      case 8:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/Menu', (Route<dynamic> route) => false);
        break;
      case 9:
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => gameInit()));
        break;
      case 10:
        Navigator.pop(context);
        Alerta.alert(context, "Você Perdeu!!!", "Deseja jogar novamente ?",
            function: () {
          transicao(Tela.jogo);
        }, function2: () {
          transicao(Tela.principal);
        });
        break;
      case 11:
        Navigator.pop(context);
        Alerta.alert(context, "Todas as fases conluídas",
            "Parabéns!!! Todas as fases estão desbloqueadas\nDeseja jogar Novamente?",
            function: () {
          FaseUtil.faseJogar = 1;
          transicao(Tela.jogo);
        }, function2: () {
          transicao(Tela.principal);
        });
        break;
    }
  }

  //modifica o valor da tela escolhida
  void transicao(Tela valor) {
    setState(() {
      tela = valor;
      mudarTela();
      Propaganda.popUp();
    });
  }

  Widget gameInit() {
    game = BoxGame(this);

    TapGestureRecognizer tapper = TapGestureRecognizer();
    // tapper.onTapDown = game.onTapDown;
    tapper.onTapUp = game.onTapUp;
    flameUtil = Util();
    flameUtil.addGestureRecognizer(tapper); //adiciono o evento

    return Scaffold(
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: game.onPanStart,
            onPanUpdate: game.onPanUpdate,
            onPanEnd: game.onPanEnd,
            child: WillPopScope(
              onWillPop: () {
                Flame.bgm.stop();
                return Future(() => true);
              },
              child: Container(
                padding: EdgeInsets.all(7),
                child: game.widget,
              ),
            )));
  }
}
