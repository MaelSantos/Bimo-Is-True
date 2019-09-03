import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:log_man/model/alien.dart';
import 'package:log_man/util/movimento.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/menu.dart';

class BoxGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  Alien _alien;

  // Tela tela = Tela.principal;
  MenuState menu;

  BoxGame(this.menu) {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    _alien = Alien(this, screenSize.width / 2, screenSize.height / 2);
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
    _alien.render(canvas);
  }

  void update(double t) {
    _alien.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    _alien.animar();
    _alien.mover(Movimento.cima);
  }
}
