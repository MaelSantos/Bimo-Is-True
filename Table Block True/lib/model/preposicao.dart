import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';

class Preposicao extends SpriteComponent{

  final BoxGame game;
  Rect ponto;
  TipoPreposicao tipo;
  Sprite simbolo;

  Preposicao(this.game, double x, double y)
  {
    ponto = Rect.fromLTWH(x, y, 50, 50);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(ponto.translate(-game.camera.x, 0), Paint());
  }

  @override
  void update(double t) {
  }

}