import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/model/preposicao.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/util/valorUtil.dart';
import 'package:tableblocktrue/view/alerta.dart';

class Proposicao extends SpriteComponent {
  final BoxGame game;
  final Alien _alien;
  Random _random;
  Rect ponto;
  Paint _paint;
  Sprite simbolo;
  TextConfig config;
  List<Preposicao> preposicoes;
  List<bool> _valores;
  bool resultado;

  Proposicao(this.game, this._alien, double x, double y) {
    ponto = Rect.fromLTWH(x, y, 100, 50);
    // simbolo = Sprite("bloco.png");
    config =
        TextConfig(fontSize: 19.0, fontFamily: 'Special', color: Colors.white);

    _random = Random();
    _paint = Paint();
    _valores = List();
    _valores.add(_random.nextBool());
    _valores.add(_random.nextBool());

    resultado = _random.nextBool();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(ponto, _paint);
    config.render(
        canvas,
        "${boolInString(_valores[0])} ? ${boolInString(_valores[1])} = ${boolInString(resultado)}",
        Position(ponto.left + 10, ponto.top + 15));
    // simbolo.renderRect(canvas, ponto);
  }

  @override
  void update(double t) {
    preposicoes.forEach((f) {
      if (f.ponto.overlaps(ponto)) {
        bool valor = calcularProposicao(f.tipo, _valores);
        if (valor == resultado) {
          _paint.color = Colors.green;
          // game.menu.transicao(Tela.alerta);
          FaseUtil.faseAtual++;
        } else
          _paint.color = Colors.red;
      }
      // else _paint.color = Colors.black;
    });
  }
}
