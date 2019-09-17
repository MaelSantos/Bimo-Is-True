
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:log_man/controler/game.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/ajuda.dart';
import 'package:log_man/view/cadastro.dart';

import 'package:log_man/view/config.dart';
import 'package:log_man/view/fase.dart';
import 'package:log_man/view/info.dart';
import 'package:log_man/view/login.dart';
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
  Login login;
  Cadastro cadastro;
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
    tela = Tela.login;
    //telas de suporte
    login = Login(this);
    cadastro = Cadastro(this);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      // bottomNavigationBar: ,
      body: mudarTela(),
    );
  }

  //faz a mudança das telas
  Widget mudarTela() {
    switch (tela.index) {
      case 0:
        return login;
      case 1:
        return cadastro;
      case 2:
        return principal;
      case 3:
        return fase;
      case 4:
        return game.widget;
      case 5:
        return config;
      case 6:
        return ajuda;
      case 7:
        return info;
      case 8:
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
