import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:tableblocktrue/controller/game.dart';

class Colisao extends PositionComponent{

  final BoxGame game;

  Colisao(this.game, {double x = 0, double y = 0, double largura = 0, double altura = 0}){
    this.x = x;
    this.y = y;
    this.width = largura;
    this.height = altura;
  }

  @override
  void render(Canvas c) {
    // c.drawRect(Rect.fromLTWH(x , y, width, height), Paint());
    // c.drawRect(toRect(), Paint());
  }

  @override
  void update(double t) {
  }
  
  bool isColid(Rect r)
  {
    return r.overlaps(this.toRect());
  }

  @override
  Rect toRect() {
    Rect r = super.toRect();

    r = r.translate( ( - game.camera.x) , 0);

    return r;
  }


}