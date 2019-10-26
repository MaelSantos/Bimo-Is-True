import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/colisao.dart';

class Entidade extends SpriteComponent {
  bool isVivo = false;
  double get velocidade => 7;

  final BoxGame game;

  List<Sprite> sprites;
  Sprite spriteFim;
  double aparencia = 0;

  Rect entidadeRect;
  bool move = false;
  double angulo = 0.0;

  List<Colisao> colisoes;

  Entidade(this.game) {
    colisoes = List();
  }

  @override
  void render(Canvas canvas) {
    if (isVivo) {
      spriteFim.renderRect(canvas, entidadeRect);
    } else {
      // canvas.drawRect(entidadeRect, Paint());
      // Future.delayed(const Duration(seconds: 1), () => 
      sprites[aparencia.toInt()].renderRect(canvas, entidadeRect);
    }
  }

  @override
  void update(double t) {
    super.update(t);
    if (move) {
      double nextX = (velocidade * t) * cos(angulo);
      double nextY = (velocidade * t) * sin(angulo);

      Offset nextPoint = Offset(nextX * velocidade, nextY * velocidade);

      Offset diffBase = Offset(entidadeRect.center.dx + nextPoint.dx,
              entidadeRect.center.dy + nextPoint.dy) -
          entidadeRect.center;

      //atualiza posição do personagem
      if (!collision(colisoes, diffBase)) // verifica as colisões
        entidadeRect = entidadeRect.shift(diffBase); //movimenta a entidade

      animar();
    }
  }

  @override
  bool destroy() {
    return isVivo;
  }

  @override
  void resize(Size size) {}

  void animar() {
    if (aparencia > 0) {
      aparencia = 0;
    } else {
      aparencia = 1;
    }
  }

  // void colisao(Entidade entidade) {
  //   move = this.toRect().contains(entidade.toRect().bottomCenter) ||
  //       this.toRect().contains(entidade.toRect().bottomLeft) ||
  //       this.toRect().contains(entidade.toRect().bottomRight);

  //   // entidade.isVivo = isVivo;
  // }

  bool collision(List<Colisao> collision, Offset ponto) {
    Rect deslocamento = entidadeRect.shift(ponto);

    for (Colisao r in collision) {
      if (deslocamento.overlaps(r.toRect())) return true;
    }
    return false;
  }
}
