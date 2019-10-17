import 'dart:math';
import 'dart:ui';

import 'package:flame/components/tiled_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/button_component.dart';
import 'package:tableblocktrue/view/joystick.dart';
import 'package:tableblocktrue/view/menu.dart';
import 'package:tiled/tiled.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Random rnd;
  List<Rect> colisoes;

  Alien alien;
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
    alien = Alien(this, 25, 20);
    mapa = TiledComponent("mapa.tmx");
    add(mapa);

    btnVoltar = ButtonComponent(this, 20, 0, "icons/voltar.png", onPressed: () {
      menu.transicao(Tela.sair);
    });

    joystick = Joystick(this);
    colisoes = List();

    _addCollision(mapa);

    alien.colisoes = colisoes;
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

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    alien.render(canvas);
    joystick.render(canvas);
    btnVoltar.render(canvas);

    // alien.colisoes.forEach((c) {
    //   canvas.drawRect(c, Paint());
    // });
  }

  @override
  void update(double t) {
    super.update(t);
    joystick.update(t);
    alien.update(t);
  }

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

  void _addCollision(TiledComponent tiledMap) async {
    final ObjectGroup obj = await tiledMap.getObjectGroupFromLayer("colisao");

    if (obj == null) {
      return;
    }
    for (TmxObject obj in obj.tmxObjects) {
      Rect r = Rect.fromLTWH(obj.x.toDouble(), obj.y.toDouble(),
          obj.width.toDouble(), obj.height.toDouble());

      colisoes.add(r);
    }
  }
}
