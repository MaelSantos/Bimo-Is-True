import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/model/entidade.dart';

class HungryFly extends Entidade {
  HungryFly(BoxGame game, double x, double y) : super(game) {

    // 1.5 x 1.1 = 1.65
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}