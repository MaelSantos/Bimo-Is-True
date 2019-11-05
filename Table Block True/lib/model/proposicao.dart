import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controller/game.dart';
import 'package:tableblocktrue/model/preposicao.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/util/valorUtil.dart';

class Proposicao extends SpriteComponent {
  final BoxGame game;
  Random _random;
  Rect ponto;
  double largura, altura;
  Paint _paint;
  TextConfig config;
  List<Preposicao> preposicoes;
  List<bool> _valores;
  bool resultado;

  Proposicao(this.game) {
    config =
        TextConfig(fontSize: 19.0, fontFamily: 'Special', color: Colors.white);

    _random = Random();
    _paint = Paint();
    _valores = gerarValores();

    altura = 50;
    largura = (_valores.length * 45.0) + 10;
    x = (game.screenSize.width / 2) - largura / 2;
    y = (game.screenSize.height / 2) + altura * 2 - 5;

    ponto = Rect.fromLTWH(x, y, largura, altura);
    resultado = _random.nextBool();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(ponto, _paint);
    config.render(
        canvas,
        gerarProposicao(_valores) + "${boolInString(resultado)}",
        Position(ponto.left + 10, ponto.top + 15));
  }

  @override
  void update(double t) {
    // print("Fase Jogar: ${FaseUtil.faseJogar}");
    // print("Fase Atual: ${FaseUtil.faseAtual}");
    // print("Fase Final: ${FaseUtil.faseFinal}");

    preposicoes.forEach((f) {
      if (ponto.overlaps(f.ponto)) {
        bool valor = calcularProposicao(f.tipo, _valores);
        if (valor == resultado) {
          _paint.color = Colors.green;
          print("AMADA???????${!FaseUtil.faseFinal}");
          if (!FaseUtil.faseFinal) {

            FaseUtil.setFaseAtual(1);
            FaseUtil.faseJogar = FaseUtil.faseAtual;
            game.menu.transicao(Tela.proxima_fase);
            game.isGame = false;
            return;

          } else {
            game.menu.transicao(Tela.gameoverSucesso);
          }

        } else {
          _paint.color = Colors.red;
          game.menu.transicao(Tela.gameoverFalha);
        }
      }
    });
  }
}
