import 'dart:ui';

import 'package:flame/components/component.dart';

abstract class Entidade extends SpriteComponent{

  double x, y;
  double largura, altura;
  bool inVisivel;

  @override
  void update(double t) {
    // TODO: implement update
    super.update(t);
  }

  @override
  bool destroy() {
    return inVisivel;
  }

  @override
  void resize(Size size) {
  }

  void colisao(Entidade entidade)
  {
    inVisivel = this.toRect().contains(entidade.toRect().bottomCenter) ||
            this.toRect().contains(entidade.toRect().bottomLeft) ||
            this.toRect().contains(entidade.toRect().bottomRight);

    entidade.inVisivel = inVisivel;
  }

}