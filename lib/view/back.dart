import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controler/game.dart';
import 'package:tiled/tiled.dart';

class Backyard {
  final BoxGame game;
  Sprite bgSprite;

  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite('sprite/tileset.png');

    // 1080 pixels ÷ 9 tiles = 120 pixels per tile
    // 2760 pixels ÷ 120 pixels per tile = 23 tiles
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 10, 
      game.tileSize * 23,
    );
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);

    Offset p = Offset(0, 0);
    Paint paint = Paint();
    String tmxBody =  "..." ;
    var parser = new TileMapParser();
    TileMap ma = parser.parse(tmxBody);

    // canvas.drawImage(ma.tilesets[0].image, p, paint);
  }

  void update(double t) {
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 11,
      game.tileSize * 23,
    );
  }
}
