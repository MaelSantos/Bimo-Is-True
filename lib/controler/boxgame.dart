import 'dart:math';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:log_man/model/agilefly.dart';
import 'package:log_man/model/droolerfly.dart';
import 'package:log_man/model/entidade.dart';
import 'package:log_man/model/housefly.dart';
import 'package:log_man/model/hungryfly.dart';
import 'package:log_man/model/machofly.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/back.dart';
import 'package:log_man/view/menu.dart';
import 'package:log_man/view/spawner.dart';
import 'package:log_man/view/startbutton.dart';

class BoxGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  Backyard background;
  List<Entidade> flies;
  StartButton startButton;

  FlySpawner spawner;

  Tela activeView = Tela.home;
  MenuState menu;

  BoxGame(this.menu) {
    initialize();
  }

  void initialize() async {
    rnd = Random();
    flies = List<Entidade>();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    startButton = StartButton(this);

    spawner = FlySpawner(this);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void render(Canvas canvas) {
    background.render(canvas);

    flies.forEach((Entidade fly) => fly.render(canvas));

    if (activeView == Tela.home || activeView == Tela.lost) {
      startButton.render(canvas);
    }
  }

  void update(double t) {
    spawner.update(t);
    flies.forEach((Entidade fly) => fly.update(t));
    flies.removeWhere((Entidade fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    // start button
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == Tela.home || activeView == Tela.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    // flies
    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Entidade fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      
      if (activeView == Tela.playing && !didHitAFly) {
        activeView = Tela.lost;
        menu.transicao(Tela.principal);
      }
    }
  }
}