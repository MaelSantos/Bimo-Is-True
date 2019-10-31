import 'dart:math';
import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/model/preposicao.dart';

class Entidade extends SpriteComponent {
  bool isVivo = false;
  double get velocidade => 9;

  final BoxGame game;

  List<Sprite> sprites;
  AnimationComponent direita;
  AnimationComponent esquerda;
  Sprite spriteFim;
  double aparencia = 0;

  Rect entidadeRect;
  bool move = false;
  double angulo = 0.0;

  List<Colisao> colisoes;
  List<Preposicao> preposicoes;
  Preposicao escolhida;
  bool segurando = false;

  Entidade(this.game) {
    colisoes = List();
  }

  @override
  void render(Canvas canvas) {
    if (isVivo) {
      spriteFim.renderRect(canvas, entidadeRect);
    } else {
      if (angulo > -2 && angulo < 1)
        direita.render(canvas);
      else
        esquerda.render(canvas);
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
      {
        entidadeRect = entidadeRect.shift(diffBase); //movimenta a entidade
        direita.setByRect(entidadeRect);
        esquerda.setByRect(entidadeRect);
      }

      direita.update(t);
      esquerda.update(t);
    }
  }

  @override
  bool destroy() {
    return isVivo;
  }

  @override
  void resize(Size size) {}

  bool collision(List<Colisao> collision, Offset ponto) {
    Rect deslocamento = entidadeRect.shift(ponto);

    for (Colisao r in collision) {
      if (deslocamento.overlaps(r.toRect())) return true;
    }

    // if (segurando) {
      for (Preposicao p in preposicoes) {
        // if(p.tipo == escolhida.tipo) return false;
        if (deslocamento.overlaps(p.ponto)) return true;
      // }
    }

    return false;
  }
}
