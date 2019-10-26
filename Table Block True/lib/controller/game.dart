import 'dart:math';
import 'dart:ui';

import 'package:flame/components/tiled_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/model/preposicao.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/button_component.dart';
import 'package:tableblocktrue/view/joystick.dart';
import 'package:tableblocktrue/view/menu.dart';
import 'package:tiled/tiled.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Random rnd;

  Alien alien;
  List<Preposicao> _preposicoes;
  TiledComponent mapa;
  ButtonComponent btnVoltar;
  Joystick joystick;

  MenuState menu;

  BoxGame(this.menu) {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    alien = Alien(this, 35, 40);
    mapa = TiledComponent("map1.tmx");
    add(mapa);

    btnVoltar = ButtonComponent(this, 20, 0, "icons/voltar.png", onPressed: () {
      menu.transicao(Tela.sair);
    });

    joystick = Joystick(this);

    _preposicoes = List();
    _addCollision(mapa);

    print(alien.colisoes);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    joystick.render(canvas);
    btnVoltar.render(canvas);

    _preposicoes.forEach((f) {
      f.render(canvas);
    });

    alien.render(canvas);

    // alien.colisoes.forEach((c) {
    //   canvas.drawRect(c.toRect(), Paint());
    // });
  }

  @override
  void update(double t) {
    super.update(t);
    joystick.update(t);
    alien.update(t);

    _preposicoes.forEach((f) {
      f.update(t);
    });

    //atualiza posição da camera
    if (mapa.map != null) {
      camera.x = min((mapa.map.tileWidth * 32) - screenSize.width,
          max(0, alien.entidadeRect.left - screenSize.width / 2));
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    btnVoltar.onTapDown(d);
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

  void gerarPreposicao() {
    // if(_preposicoes.isNotEmpty)
    //   _preposicoes.clear();"

    for (var i = 0; i < 5; i++) {
      List l = gerarPosicao();
      print(l[0]);
      _preposicoes.add(Preposicao(this, alien, l[0], l[1]));
    }

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
  }
}
