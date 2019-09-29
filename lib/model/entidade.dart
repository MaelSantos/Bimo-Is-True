import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controler/game.dart';
import 'package:tableblocktrue/util/movimento.dart';

class Entidade extends SpriteComponent {
  bool isVivo = false;
  bool isOffScreen = false;
  double get speed => 3;

  final BoxGame game;
  Rect entidadeRect;

  List<Sprite> sprites;
  Sprite spriteFim;
  double aparencia = 0;

  Entidade(this.game);

  @override
  void render(Canvas c) {
    if (isVivo) {
      spriteFim.renderRect(c, entidadeRect.inflate(2));
    } else {
      sprites[aparencia.toInt()].renderRect(c, entidadeRect.inflate(2));
    }
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  bool destroy() {
    return isVivo;
  }

  @override
  void resize(Size size) {}

  void onTapDown() {
    // isVivo = true;
    mover(Movimento.cima);
  }

  void mover(Movimento m) {
    if (m == Movimento.cima)
      entidadeRect = entidadeRect.translate(0, -speed); //cima
    else if (m == Movimento.baixo)
      entidadeRect = entidadeRect.translate(0, speed); //baixo
    else if (m == Movimento.esquerda)
      entidadeRect = entidadeRect.translate(-speed, 0); //esquerda
    else if (m == Movimento.direita)
      entidadeRect = entidadeRect.translate(speed, 0); //direita

    animar();
  }

  void animar()
  {
    if(aparencia > 0){
      aparencia = 0;
    }
    else{
      aparencia = 1;
    }
  }

  void colisao(Entidade entidade) {
    isVivo = this.toRect().contains(entidade.toRect().bottomCenter) ||
        this.toRect().contains(entidade.toRect().bottomLeft) ||
        this.toRect().contains(entidade.toRect().bottomRight);

    entidade.isVivo = isVivo;
  }
}
