import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/util/tela.dart';

class StartButton {
  final BoxGame game;
  Rect rect;
  Sprite sprite;

  bool isHandled = false;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 3,
    );
    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {
    game.activeView = Tela.playing;
  }
}
