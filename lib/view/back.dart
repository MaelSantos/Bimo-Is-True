import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controler/game.dart';

class Backyard {
  final BoxGame game;
  Sprite bgSprite;

  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');

    // 1080 pixels ÷ 9 tiles = 120 pixels per tile
    // 2760 pixels ÷ 120 pixels per tile = 23 tiles
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9, 
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
