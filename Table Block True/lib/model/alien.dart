import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controler/game.dart';
import 'package:tableblocktrue/model/entidade.dart';

class Alien extends Entidade {
  
  Alien(BoxGame game, double x, double y) : super(game) {

    entidadeRect = Rect.fromLTWH(x, y, 30, 30);

    sprites = List();
    sprites.add(Sprite('sprite/bege_direita1.png'));
    sprites.add(Sprite('sprite/bege_direita2.png'));
    spriteFim = Sprite('sprite/bege_padrao.png');
  }
}