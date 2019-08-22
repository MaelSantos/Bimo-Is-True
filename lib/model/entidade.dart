import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:log_man/controler/boxgame.dart';

class Entidade extends SpriteComponent {
  bool isVivo = false;
  bool isOffScreen = false;

  final BoxGame game;
  Rect flyRect;

  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Offset targetLocation;

  Entidade(this.game) {
    setTargetLocation();
  }

  double get speed => game.tileSize * 3;

  @override
  void render(Canvas c) {
    if (isVivo) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  @override
  void update(double t) {
    if (isVivo) {
      flyRect = flyRect.translate(
          0, game.tileSize * 12 * t); //12 representa a velocidade
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }

    flyingSpriteIndex += 30 * t; //como são dois quadros por segundo então: 2 / 60 = 30
    if (flyingSpriteIndex >= 2) {
      flyingSpriteIndex -= 2; //muda o valor da sprite
    }
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget =
          Offset.fromDirection(toTarget.direction, stepDistance);
      flyRect = flyRect.shift(stepToTarget);
    } else {
      flyRect = flyRect.shift(toTarget);
      setTargetLocation();
    }
    super.update(t);
  }

  @override
  bool destroy() {
    return isVivo;
  }

  @override
  void resize(Size size) {}

  void onTapDown() {
    isVivo = true;
    // game.spawnFly();
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void colisao(Entidade entidade) {
    isVivo = this.toRect().contains(entidade.toRect().bottomCenter) ||
        this.toRect().contains(entidade.toRect().bottomLeft) ||
        this.toRect().contains(entidade.toRect().bottomRight);

    entidade.isVivo = isVivo;
  }
}
