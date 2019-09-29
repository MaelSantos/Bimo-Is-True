import 'dart:ui';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:tableblocktrue/controler/game.dart';

class ButtonComponent {
  final BoxGame game;
  Rect rect;
  double x, y;
  Position position;
  Sprite sprite;

  final Function onPressed;

  ButtonComponent(this.game, this.x, this.y, String caminho, {this.onPressed}) {
    resize();

    try {
      sprite = Sprite(caminho);
    } catch (e) {
      sprite = Sprite('icons/atencao.png');
    }
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    // sprite.renderPosition(canvas, Position(100, 100));
  }

  void update(double t) {
    
  }

  void resize() {
    rect = Rect.fromLTWH(
      game.screenSize.width * 0.75 + x,
      game.screenSize.height * 0.75 + y,
      game.tileSize * 1.75,
      game.tileSize * 1.75,
    );

  }

  void onTapDown(TapDownDetails d) {
    if (rect.contains(d.globalPosition)) {
      onPressed();
    }
  }
}
