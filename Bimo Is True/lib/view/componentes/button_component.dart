import 'dart:ui';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controller/game.dart';

class ButtonComponent {
  final BoxGame game;
  Rect rect;
  double x, y;
  Position position;
  Sprite sprite;

  final Function onPressed;

  ButtonComponent(this.game, this.x, this.y, String caminho, {this.onPressed}) {

    try {
      sprite = Sprite(caminho);
    } catch (e) {
      sprite = Sprite('icons/atencao.png');
    }

    rect = Rect.fromLTWH(this.x, this.y, 70, 70);
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double t) {
    
  }

  void resize() {
  }

  void onTapDown(TapDownDetails d) {
    if (rect.contains(d.globalPosition)) {
      onPressed();
    }
  }

  void onTapUp(TapUpDetails d) {
    if (rect.contains(d.globalPosition)) {
      onPressed();
    }
  }

}
