import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/ajuda.dart';

import 'package:tableblocktrue/view/config.dart';
import 'package:tableblocktrue/view/fase.dart';
import 'package:tableblocktrue/view/info.dart';
import 'package:tableblocktrue/view/inventario.dart';
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
  Scaffold detector;
  BoxGame game;

  Inventario inventario;
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
    game = BoxGame(this);
    inventario = Inventario(this, game.alien);

    detector = Scaffold(
      backgroundColor: Colors.lightBlue,
      body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: game.onPanStart,
      onPanUpdate: game.onPanUpdate,
      onPanEnd: game.onPanEnd,
      child: game.widget,
    ));

    Util flameUtil = Util();
    await flameUtil.fullScreen(); //Tela cheia
    await flameUtil.setOrientation(
        DeviceOrientation.portraitUp); //define a rotação da tela

    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
    flameUtil.addGestureRecognizer(tapper); //adiciono o evento

    // MultiTapGestureRecognizer multiTap = MultiTapGestureRecognizer();
    // multiTap.onLongTapDown = game.onLongTapDown;
    // flameUtil.addGestureRecognizer(multiTap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      // bottomNavigationBar: ,
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => detector));
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
        // SystemChannels.platform
        //     .invokeMethod('SystemNavigator.pop'); //sai da aplicação
    }
  }

  //modifica o valor da tela escolhida
  void transicao(Tela valor) {
    setState(() {
      tela = valor;
      mudarTela();
    });
  }
}
