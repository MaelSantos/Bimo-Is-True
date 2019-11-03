import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';
import 'package:tableblocktrue/util/valorUtil.dart';

class Preposicao extends SpriteComponent {
  final BoxGame game;
  final Alien _alien;
  double get velocidade => FaseUtil.velocidade;
  Rect ponto;
  bool move = false;
  double angulo = 0.0;
  TipoPreposicao tipo;
  Sprite simbolo;
  TextConfig config;

  Preposicao(this.game, this._alien, double x, double y, int tipo) {
    ponto = Rect.fromLTWH(x, y, 35, 35);
    simbolo = Sprite("bloco.png");
    this.tipo = intInTipo(tipo);
    config =
        TextConfig(fontSize: 16.0, fontFamily: 'Special', color: Colors.white);

    this.x = x;
    this.y = y;
    this.width = 50;
    this.height = 50;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(ponto, Paint());
    simbolo.renderRect(canvas, ponto);
    config.render(
        canvas,
        "${tipoInString(tipo)}",
        Position(
            ponto.left + stringInPosition(tipoInString(tipo)), ponto.top + 11));
  }

  @override
  void update(double t) {
    if (colidionInPlay(_alien)) {
      if (_alien.escolhida == null || _alien.escolhida == this) {
        _alien.escolhida = this;
      }
    }
  }

  bool colidionInPlay(Alien alien) {
    if (alien.entidadeRect.overlaps(ponto.translate(-1, 0)) ||
        alien.entidadeRect.overlaps(ponto.translate(0, -1)) ||
        alien.entidadeRect.overlaps(ponto.translate(1, 0)) ||
        alien.entidadeRect.overlaps(ponto.translate(0, 1))) {
      return true;
    }
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
