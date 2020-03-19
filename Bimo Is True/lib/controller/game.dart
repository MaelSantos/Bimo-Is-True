import 'dart:math';
import 'dart:ui';

import 'package:flame/components/tiled_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/gestures.dart';
import 'package:bimo_is_true/model/alien.dart';
import 'package:bimo_is_true/model/colisao.dart';
import 'package:bimo_is_true/model/preposicao.dart';
import 'package:bimo_is_true/model/proposicao.dart';
import 'package:bimo_is_true/util/configUtil.dart';
import 'package:bimo_is_true/util/faseUtil.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/componentes/button_component.dart';
import 'package:bimo_is_true/view/joystick.dart';
import 'package:bimo_is_true/view/menu.dart';
import 'package:tiled/tiled.dart';
import 'package:flutter/material.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Rect screenRect;
  Paint p;
  Random rnd;

  Alien alien;
  Proposicao _proposicao;
  List<Preposicao> _preposicoes;
  TiledComponent mapa;
  ButtonComponent btnVoltar, btnSegurar, btnSoltar;
  Joystick joystick;
  
  ConfigUtil configUtil = ConfigUtil();
  bool isGame;
  TextConfig config;

  MenuState menu;

  BoxGame(this.menu) {
    isGame = false;
    mapa = TiledComponent("map${FaseUtil.faseJogar}.tmx");
    add(mapa);
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    rnd = Random();
    alien = Alien(this);

    double y = screenSize.height * 0.81;
    double x = screenSize.width * 0.75;

    btnVoltar = ButtonComponent(this, x, y, "icons/voltar.png", onPressed: () {
      Flame.bgm.stop();
      menu.transicao(Tela.sair);
    });

    x = screenSize.width * 0.1;

    btnSegurar = ButtonComponent(this, x, y, "icons/segurar.png",
        onPressed: segurarBloco);

    btnSoltar =
        ButtonComponent(this, x, y, "icons/soltar.png", onPressed: soltarBloco);

    joystick = Joystick(this);

    _proposicao = Proposicao(this);

    _preposicoes = List();
    _addCollision(mapa);

    // camera.x = -5;

    config =
        TextConfig(fontSize: 19.0, fontFamily: "Special", color: Colors.white);

    p = Paint();
    p.color = Color(0xff269fbd);

    isGame = true;
    
    if (configUtil.configuracao.inVolume) {
      Flame.audio.play("iniciofase.ogg", volume: configUtil.configuracao.volume);
      Flame.bgm.play("sakura.mp3", volume: configUtil.configuracao.volume);
    }
  }

  @override
  void render(Canvas canvas) {
    if (isGame) {
      canvas.drawRect(
          Rect.fromLTWH(0, 0, screenSize.width, screenSize.height), p);

      canvas.save();
      // canvas.scale(screenSize.width.toInt() / tileSize.toInt() /10);
      // double escalaX = ((11 - (390 / screenSize.width.toInt()) ) / 10);
      double escalaX = (screenSize.width.toInt() / 392.72);
      double escalaY = (screenSize.height.toInt() / 785.5);
      // double escalaX = (500 / 390);
      // print(escalaX);
      // canvas.scale(0.8);
      canvas.scale(escalaX, escalaY);
      if (escalaX.toInt() < 1)
        canvas.translate(screenRect.center.dx - (200 * escalaX), 0.0);

      // if(mapa.map.tileWidth != null) print(mapa.map.tileWidth*12);// 384
      // if(mapa.map.tileHeight != null) print(mapa.map.tileHeight*18); 576
      // print(screenSize.width);//392.72
      // print(screenSize.height);//785.5

      super.render(canvas);

      config.render(canvas, "Pontos: ${FaseUtil.pontuacao}",
          Position(screenSize.width - 130, 580));

      _proposicao.render(canvas);
      if (_preposicoes == null) return;
      _preposicoes.forEach((f) {
        f.render(canvas);
      });
      alien.render(canvas);

      canvas.restore();

      joystick.render(canvas);
      btnVoltar.render(canvas);

      if (alien.escolhida != null)
        btnSoltar.render(canvas);
      else
        btnSegurar.render(canvas);
    }
  }

  @override
  void update(double t) {
    if (isGame) {
      super.update(t);
      joystick.update(t);
      _proposicao.update(t);
      alien.update(t);
      // _preposicoes.forEach((f) {
      //   f.update(t);
      // });
    }
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    screenRect =
        Rect.fromLTWH(5, 0, screenSize.width * 0.98, screenSize.height * 0.734);
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    if (isGame) {
      if (alien.escolhida != null)
        btnSoltar.onTapDown(d);
      else
        btnSegurar.onTapDown(d);

      btnVoltar.onTapDown(d);
    }
  }

  void onUpDown(TapUpDetails d) {
    if (isGame) {
      if (alien.escolhida != null)
        btnSoltar.onTapUp(d);
      else
        btnSegurar.onTapUp(d);

      btnVoltar.onTapUp(d);
    }
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
      if (_preposicoes == null) return;
      _preposicoes.forEach((f) {
        if (f.colidionInPlay(alien)) {
          alien.escolhida = f;
          alien.escolhida.paint.color = Color(0xff269fbd);
          return;
        }
      });
    }
  }

  void soltarBloco() {
    if (alien.escolhida != null) {
      alien.escolhida.paint.color = Colors.black;
      alien.escolhida = null;
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
