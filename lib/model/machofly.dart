import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/model/entidade.dart';

class MachoFly extends Entidade {

  double get speed => game.tileSize * 2.5;
  
  MachoFly(BoxGame game, double x, double y) : super(game) {

    // 1.5 x 1.35 = 2.025
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}