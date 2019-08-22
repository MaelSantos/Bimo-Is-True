import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/model/entidade.dart';

class DroolerFly extends Entidade {

  double get speed => game.tileSize * 1.5;
  
  DroolerFly(BoxGame game, double x, double y) : super(game) {

    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}