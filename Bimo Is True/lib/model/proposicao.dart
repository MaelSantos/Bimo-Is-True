import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
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
    // y = (game.screenSize.height) - ((18 * 32)/2) - 5;
    y = (18 * 32).toDouble() - 85;

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

    if(preposicoes == null) return;

    preposicoes.forEach((f) {
      if (ponto.overlaps(f.ponto)) {
        preposicoes.remove(f);
        game.alien.escolhida = null;
        bool valor = calcularProposicao(f.tipo, _valores);
        print("AMADA???????${!FaseUtil.faseFinal}");

        if (_valores.length == 1) {
          if (_valores[0] == resultado) {
            _paint.color = Colors.green;

            Future.delayed(Duration(seconds: 1), () {
              if (FaseUtil.faseJogar != 0) {
                game.isGame = false;
                if (!FaseUtil.faseFinal) {
                  FaseUtil.faseJogar += 1;
                  FaseUtil.setFaseAtual(1);
                  FaseUtil.pontuacao += 10;
                  game.menu.transicao(Tela.proxima_fase);
                } else {
                  FaseUtil.pontuacao = 0;
                  game.menu.transicao(Tela.gameoverSucesso);
                }
              } else {
                FaseUtil.pontuacao += 10;
                game.menu.transicao(Tela.jogo);
              }
            });
          } else {
            _paint.color = Colors.red;
            Future.delayed(Duration(seconds: 1), () {
              FaseUtil.pontuacao = 0;
              game.menu.transicao(Tela.gameoverFalha);
            });
          }

          Flame.bgm.stop();
        }
        return;
      }
    });
  }
}
