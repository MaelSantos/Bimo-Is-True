import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/ajuda.dart';

import 'package:log_man/view/config.dart';
import 'package:log_man/view/fase.dart';
import 'package:log_man/view/info.dart';
import 'package:log_man/view/principal.dart';

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
  BoxGame game;
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
    titulo = "LogMan";
    tela = Tela.principal;
    //telas de suporte
    principal = Principal(this);
    fase = Fase(this);
    config = Config(this);
    ajuda = Ajuda(this);
    info = Info(this);
    //tela jogo
    game = BoxGame(this);

    Util flameUtil = Util();
    await flameUtil.fullScreen(); //Tela cheia
    await flameUtil.setOrientation(
        DeviceOrientation.portraitUp); //define a rotação da tela

    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
    flameUtil.addGestureRecognizer(tapper); //adiciono o evento

    //carrega as imagens em cache
    Flame.images.loadAll(<String>[
      'bg/backyard.png',
      'flies/agile-fly-1.png',
      'flies/agile-fly-2.png',
      'flies/agile-fly-dead.png',
      'flies/drooler-fly-1.png',
      'flies/drooler-fly-2.png',
      'flies/drooler-fly-dead.png',
      'flies/house-fly-1.png',
      'flies/house-fly-2.png',
      'flies/house-fly-dead.png',
      'flies/hungry-fly-1.png',
      'flies/hungry-fly-2.png',
      'flies/hungry-fly-dead.png',
      'flies/macho-fly-1.png',
      'flies/macho-fly-2.png',
      'flies/macho-fly-dead.png',
      'bg/lose-splash.png',
      'branding/title.png',
      'ui/dialog-credits.png',
      'ui/dialog-help.png',
      'ui/icon-credits.png',
      'ui/icon-help.png',
      'ui/start-button.png',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: mudarTela(),
    );
  }

  //faz a mudança das telas
  Widget mudarTela() {
    switch (tela.index) {
      case 0:
        return principal;
      case 1:
        return fase;
      case 2:
        return game.widget;
      case 3:
        return config;
      case 4:
        return ajuda;
      case 5:
        return info;
      case 6:
        SystemChannels.platform
            .invokeMethod('SystemNavigator.pop'); //sai da aplicação
    }
    return null;
  }

  //modifica o valor da tela escolhida
  void transicao(Tela valor) {
    setState(() {
      tela = valor;
    });
  }
}
