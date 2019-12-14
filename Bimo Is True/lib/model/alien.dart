import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/entidade.dart';

class Alien extends Entidade {

  Alien(BoxGame game) : super(game) {

    // double x = game.screenSize.width * 0.15; //10% da largura
    // double y = game.screenSize.height * 0.05; //5% da altura
    // double dimensao = game.screenSize.height * 0.05; //5% da altura
    // entidadeRect = Rect.fromLTWH(x, y, dimensao, dimensao);

    entidadeRect = Rect.fromLTWH(40, 40, 40, 40);

    sprites = [0,1,2].map((i) => new Sprite('sprite/play_$i.png')).toList();
    this.direita = AnimationComponent(40, 40, Animation.spriteList(sprites, stepTime: 0.07));

    sprites = [3,4,5].map((i) => new Sprite('sprite/play_$i.png')).toList();
    this.esquerda = AnimationComponent(40, 40, Animation.spriteList(sprites, stepTime: 0.07));

    spriteFim = Sprite('sprite/play_0.png');

    direita.setByRect(entidadeRect);
    esquerda.setByRect(entidadeRect);

  }
}