import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/entidade.dart';

class Alien extends Entidade {
  
  bool segurando;

  Alien(BoxGame game, double x, double y) : super(game) {

    entidadeRect = Rect.fromLTWH(x, y, 40, 40);
    segurando = false;

    sprites = [0,1,2].map((i) => new Sprite('sprite/play_$i.png')).toList();
    this.direita = AnimationComponent(40, 40, Animation.spriteList(sprites, stepTime: 0.07));

    sprites = [3,4,5].map((i) => new Sprite('sprite/play_$i.png')).toList();
    this.esquerda = AnimationComponent(40, 40, Animation.spriteList(sprites, stepTime: 0.07));

    spriteFim = Sprite('sprite/play_0.png');

    direita.setByRect(entidadeRect);
    esquerda.setByRect(entidadeRect);

  }
}