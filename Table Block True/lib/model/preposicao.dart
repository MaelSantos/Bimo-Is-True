import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/colisao.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';
import 'package:tableblocktrue/util/valorUtil.dart';

class Preposicao extends SpriteComponent {
  final BoxGame game;
  final Alien _alien;
  double get velocidade => 9;
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
    if (colidionInPlay() && _alien.move) {
      angulo = _alien.angulo;

      double nextX = (velocidade * t) * cos(angulo);
      double nextY = (velocidade * t) * sin(angulo);

      Offset nextPoint = Offset(nextX * velocidade, nextY * velocidade);

      Offset diffBase = Offset(
              ponto.center.dx + nextPoint.dx, ponto.center.dy + nextPoint.dy) -
          ponto.center;

      if (!collision(_alien.colisoes, diffBase)) {
        // ponto.top = ponto.top+1;

        ponto = ponto.shift(diffBase);
        // ponto = ponto.shift(_alien.entidadeRect.translate(0, 0));
        // ponto = _alien.entidadeRect;
        // if (_alien.escolhida == null || _alien.escolhida == this) 
        // mover();
      }
    }
  }

  void mover() {
    Rect p = Rect.fromLTWH(
        _alien.entidadeRect.left + 10, _alien.entidadeRect.top + 2, 35, 35);

    for (Colisao r in _alien.colisoes) {
      if (!p.overlaps(r.toRect())) {
        ponto = Rect.fromLTWH(
            _alien.entidadeRect.left + 10, _alien.entidadeRect.top + 2, 35, 35);
        _alien.segurando = true;
        _alien.escolhida = this;
        return;
      }
    }
  }

  bool colidionInPlay() {
    if (_alien.entidadeRect.overlaps(ponto.translate(-1, 0)) ||
        _alien.entidadeRect.overlaps(ponto.translate(0, -1)) ||
        _alien.entidadeRect.overlaps(ponto.translate(1, 0)) ||
        _alien.entidadeRect.overlaps(ponto.translate(0, 1))) {
      return true;
    }
    return false;
  }

  bool collision(List<Colisao> collision, Offset p) {
    Rect deslocamento = ponto.shift(p);

    for (Colisao r in collision) {
      if (deslocamento.overlaps(r.toRect())) return true;
    }

    // if (_alien.entidadeRect.overlaps(ponto)) return true;
    if (deslocamento.overlaps(_alien.entidadeRect)) return false;

    return false;
  }
}
