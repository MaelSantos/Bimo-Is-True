import 'dart:math';
import 'dart:ui';

import 'package:flame/components/tiled_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/model/preposicao.dart';
import 'package:tableblocktrue/model/proposicao.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/button_component.dart';
import 'package:tableblocktrue/view/joystick.dart';
import 'package:tableblocktrue/view/menu.dart';
import 'package:tiled/tiled.dart';
import 'package:flutter/material.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Random rnd;

  Alien alien;
  Proposicao _proposicao;
  List<Preposicao> _preposicoes;
  TiledComponent mapa;
  ButtonComponent btnVoltar, btnSegurar, btnSoltar;
  Joystick joystick;

  MenuState menu;

  BoxGame(this.menu) {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    alien = Alien(this, 50, 40);
    mapa = TiledComponent("map${FaseUtil.faseJogar}.tmx");
    add(mapa);

    btnVoltar =
        ButtonComponent(this, 300, 630, "icons/voltar.png", onPressed: () {
      menu.transicao(Tela.sair);
    });

    btnSegurar = ButtonComponent(this, 50, 630, "icons/segurar.png",
        onPressed: segurarBloco);

    btnSoltar = ButtonComponent(this, 50, 630, "icons/soltar.png",
        onPressed: soltarBloco);

    joystick = Joystick(this);

    _proposicao = Proposicao(this, 150, 490);

    _preposicoes = List();
    _addCollision(mapa);

    camera.x = -5;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    joystick.render(canvas);
    btnVoltar.render(canvas);

    if (alien.escolhida != null)
      btnSoltar.render(canvas);
    else
      btnSegurar.render(canvas);

    _proposicao.render(canvas);
    _preposicoes.forEach((f) {
      f.render(canvas);
    });
    alien.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);
    joystick.update(t);
    alien.update(t);
    // _preposicoes.forEach((f) {
    //   f.update(t);
    // });
    _proposicao.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {

    if (alien.escolhida != null)
      btnSoltar.onTapDown(d);
    else
      btnSegurar.onTapDown(d);

    btnVoltar.onTapDown(d);
  }

  void onUpDown(TapUpDetails d) {

    if (alien.escolhida != null)
      btnSoltar.onTapUp(d);
    else
      btnSegurar.onTapUp(d);

    btnVoltar.onTapUp(d);
  }

  void onPanStart(DragStartDetails details) {
    joystick.onPanStart(details);
  }

  void onPanUpdate(DragUpdateDetails details) {
    joystick.onPanUpdate(details);
  }

  void onPanEnd(DragEndDetails details) {
    joystick.onPanEnd(details);
  }

  void segurarBloco() {
    if (alien.escolhida == null) {
      _preposicoes.forEach((f) {
        if (f.colidionInPlay(alien)) {
          alien.escolhida = f;
          print(alien.escolhida);
          print("segurando");
          return;
        }
      });
    }
  }

  void soltarBloco() {
    if (alien.escolhida != null) {
      print(alien.escolhida);
      alien.escolhida = null;
      print("soltando");
      print(alien.escolhida);
    }
  }

  void gerarPreposicao() {
    for (var i = 0; i < 5; i++) {
      List l = gerarPosicao();
      _preposicoes.add(Preposicao(this, alien, l[0], l[1], i));
    }
  }

  List gerarPosicao() {
    List i = List();
    bool colid = true;

    while (true) {
      colid = true;
      double x = rnd.nextDouble() * (screenSize.width - (tileSize));
      double y = rnd.nextDouble() * (16 * 32) - 50;

      Rect r = Rect.fromLTWH(x, y, 50, 50);

      for (Colisao c in alien.colisoes) {
        if (r.overlaps(c.toRect())) {
          colid = false;
        }
      }

      for (Preposicao p in _preposicoes) {
        if (r.overlaps(p.ponto)) {
          colid = false;
        }
      }

      if (r.overlaps(alien.entidadeRect)) colid = false;

      if (r.overlaps(_proposicao.ponto)) colid = false;

      if (colid) {
        i.add(x);
        i.add(y);
      }
      if (i.isNotEmpty) return i;
    }
  }

  void _addCollision(TiledComponent tiledMap) async {
    final ObjectGroup obj = await tiledMap.getObjectGroupFromLayer("colisao");

    if (obj == null) {
      return;
    }
    for (TmxObject obj in obj.tmxObjects) {
      Colisao colisao = Colisao(this,
          x: obj.x.toDouble(),
          y: obj.y.toDouble(),
          largura: obj.width.toDouble(),
          altura: obj.height.toDouble());

      alien.colisoes.add(colisao);
      add(colisao);
    }

    gerarPreposicao();
    alien.preposicoes = _preposicoes;
    _proposicao.preposicoes = _preposicoes;
  }
}
