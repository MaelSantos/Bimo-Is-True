import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/entidade.dart';

class Alien extends Entidade {
  
  bool segurando;

  Alien(BoxGame game, double x, double y) : super(game) {

    entidadeRect = Rect.fromLTWH(x, y, 40, 40);
    segurando = false;

    sprites = [0,1,2].map((i) => new Sprite('sprite/play_$i.png')).toList();
    spriteFim = Sprite('sprite/play_0.png');
  }
}