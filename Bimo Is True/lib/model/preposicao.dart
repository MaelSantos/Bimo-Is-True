import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:bimo_is_true/controller/game.dart';
import 'package:bimo_is_true/model/alien.dart';
import 'package:bimo_is_true/model/colisao.dart';
import 'package:bimo_is_true/util/faseUtil.dart';
import 'package:bimo_is_true/util/tipos_preposicao.dart';
import 'package:bimo_is_true/util/valorUtil.dart';

class Preposicao extends SpriteComponent {
  final BoxGame game;
  final Alien _alien;
  double get velocidade => FaseUtil.velocidade;
  Rect ponto;
  bool move = false;
  double angulo = 0.0;
  TipoPreposicao tipo;
  Sprite simbolo;
  Paint paint;
  TextConfig config;

  Preposicao(this.game, this._alien, double x, double y, int tipo) {


    // double dimensao = game.screenSize.height * 0.045; //4.5% da altura
    // ponto = Rect.fromLTWH(x, y, dimensao, dimensao);
    ponto = Rect.fromLTWH(x, y, 35, 35);
    simbolo = Sprite("bloco.png");
    paint = Paint();
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
    canvas.drawRect(ponto, paint);
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
    if (alien.entidadeRect.overlaps(ponto.translate(-2, 0)) ||
        alien.entidadeRect.overlaps(ponto.translate(0, -2)) ||
        alien.entidadeRect.overlaps(ponto.translate(2, 0)) ||
        alien.entidadeRect.overlaps(ponto.translate(0, 2))) {
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
