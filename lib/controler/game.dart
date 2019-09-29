import 'dart:math';

import 'package:flame/components/tiled_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/util/movimento.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/button-component.dart';
import 'package:tableblocktrue/view/menu.dart';

class BoxGame extends BaseGame {

  Size screenSize;
  double tileSize;
  Random rnd;

  Alien alien;
  TiledComponent mapa;
  ButtonComponent btnCima, btnBaixo, btnDireita, btnEsquerda, btnVoltar;

  MenuState menu;

  BoxGame(this.menu) {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    alien = Alien(this, screenSize.width / 2, screenSize.height / 2);
    mapa = TiledComponent("mapa.tmx");
    add(mapa);

    btnCima = ButtonComponent(this, -140, -70, "icons/cima.png", onPressed: () {alien.mover(Movimento.cima);});
    btnBaixo = ButtonComponent(this, -140, 20, "icons/baixo.png", onPressed: () {alien.mover(Movimento.baixo);});
    btnDireita = ButtonComponent(this, -90, -30, "icons/direita.png", onPressed: () {alien.mover(Movimento.direita);});
    btnEsquerda = ButtonComponent(this, -190, -30, "icons/esquerda.png", onPressed: () {alien.mover(Movimento.esquerda);});
    btnVoltar  = ButtonComponent(this,  20, 0,"icons/voltar.png", onPressed: () {menu.transicao(Tela.principal);});

  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    // switch (rnd.nextInt(5)) {
    //   case 0:
    //     flies.add(HouseFly(this, x, y));
    //     break;
    //   case 1:
    //     flies.add(DroolerFly(this, x, y));
    //     break;
    //   case 2:
    //     flies.add(AgileFly(this, x, y));
    //     break;
    //   case 3:
    //     flies.add(MachoFly(this, x, y));
    //     break;
    //   case 4:
    //     flies.add(HungryFly(this, x, y));
    //     break;
    // }
  }

  void render(Canvas canvas) {
    super.render(canvas);
    alien.render(canvas);

    btnCima.render(canvas);
    btnBaixo.render(canvas);
    btnDireita.render(canvas);
    btnEsquerda.render(canvas);
    btnVoltar.render(canvas);
  }

  void update(double t) {
    super.update(t);
    alien.update(t);

    btnVoltar.resize();
    btnCima.resize();
    btnBaixo.resize();
    btnDireita.resize();
    btnEsquerda.resize();
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {

    btnCima.onTapDown(d);
    btnBaixo.onTapDown(d);
    btnDireita.onTapDown(d);
    btnEsquerda.onTapDown(d);
    btnVoltar.onTapDown(d);

  }

  void onLongTapDown(int i, TapDownDetails d) {

    btnCima.onTapDown(d);
    btnBaixo.onTapDown(d);
    btnDireita.onTapDown(d);
    btnEsquerda.onTapDown(d);
    btnVoltar.onTapDown(d);

  }

}
