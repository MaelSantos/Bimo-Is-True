import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';

class Preposicao extends SpriteComponent {
  final BoxGame game;
  final Alien _alien;
  double get velocidade => 7;
  Rect ponto;
  bool move = false;
  double angulo = 0.0;
  TipoPreposicao tipo;
  Sprite simbolo;

  Preposicao(this.game, this._alien, double x, double y) {
    ponto = Rect.fromLTWH(x, y, 50, 50);
    simbolo = Sprite("bloco.png");
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(ponto.translate(-game.camera.x, 0), Paint());
    simbolo.renderRect(canvas, ponto.translate(-game.camera.x, 0));
  }

  @override
  void update(double t) {
    // if (move) {
    if (colidionInPlay()) {
      angulo = _alien.angulo;

      double nextX = (velocidade * t) * cos(angulo);
      double nextY = (velocidade * t) * sin(angulo);

      Offset nextPoint = Offset(nextX * velocidade, nextY * velocidade);

      Offset diffBase = Offset(
              ponto.center.dx + nextPoint.dx, ponto.center.dy + nextPoint.dy) -
          ponto.center;

      if (!collision(_alien.colisoes, diffBase)) ponto = ponto.shift(diffBase);
    }
    // }
  }

  bool colidionInPlay() {
    if (_alien.entidadeRect.overlaps(ponto)) return true;
    return false;
  }

  bool collision(List<Colisao> collision, Offset p) {
    Rect deslocamento = ponto.shift(p);

    for (Colisao r in collision) {
      if (deslocamento.overlaps(r.toRect())) return true;
    }
    return false;
  }
}
