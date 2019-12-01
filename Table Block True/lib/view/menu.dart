import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/ajuda.dart';
import 'package:tableblocktrue/view/alerta.dart';

import 'package:tableblocktrue/view/config.dart';
import 'package:tableblocktrue/view/fase.dart';
import 'package:tableblocktrue/view/info.dart';
import 'package:tableblocktrue/view/principal.dart';

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
    await flameUtil.fullScreen(); //Tela cheia
    //define a rotação da tela
    await flameUtil.setOrientation(DeviceOrientation.portraitUp);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: principal,
    );
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
        // game.iniciarFase();
        Navigator.popAndPushNamed(context, "/Menu");
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
        Navigator.popAndPushNamed(context, "/Menu");
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
      child: game.widget,
    ));
  }
}
