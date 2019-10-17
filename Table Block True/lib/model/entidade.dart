import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/util/movimento.dart';

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

  List<Rect> colisoes;

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
    if (move) {
      double nextX = (velocidade * t) * cos(angulo);
      double nextY = (velocidade * t) * sin(angulo);
      Offset nextPoint = Offset(nextX * velocidade, nextY * velocidade);

      Offset diffBase = Offset(entidadeRect.center.dx + nextPoint.dx,
              entidadeRect.center.dy + nextPoint.dy) -
          entidadeRect.center;

      if(!collision(colisoes, diffBase))
      entidadeRect = entidadeRect.shift(diffBase);

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

  // Future<bool> colisao(Rect c) async {
  //   colid = entidadeRect.contains(c.bottomCenter) ||
  //       entidadeRect.contains(c.bottomLeft) ||
  //       entidadeRect.contains(c.bottomRight) ||
  //       entidadeRect.contains(c.topCenter) ||
  //       entidadeRect.contains(c.topLeft) ||
  //       entidadeRect.contains(c.topRight);
  //   print(colid);

  //   return colid;

  // }

  // bool collision(List<Rect> collision) {
  //   for(Rect r in collision){
  //     if(entidadeRect.overlaps(r))
  //       return true;
  //   }
  //   return false;
  // }

  bool collision(List<Rect> collision, Offset ponto) {

    Rect deslocamento = entidadeRect.shift(ponto);

    for(Rect r in collision){
      if(deslocamento.overlaps(r))
        return true;
    }
    return false;
  }
}
