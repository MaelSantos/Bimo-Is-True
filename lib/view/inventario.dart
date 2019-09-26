import 'package:flutter/material.dart';
import 'package:tableblocktrue/model/alien.dart';
import 'package:tableblocktrue/util/movimento.dart';
import 'package:tableblocktrue/util/tela.dart';

import 'menu.dart';

class Inventario extends StatelessWidget {
  MenuState menu;
  Alien _alien;

  Inventario(this.menu, this._alien);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {
                      _alien.mover(Movimento.esquerda);
                    },
                    child: Image.asset("assets/icons/esquerda.png")),
              ]),
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {
                      _alien.mover(Movimento.cima);
                    },
                    child: Image.asset("assets/icons/cima.png")),
                    FlatButton(
                    onPressed: () {
                      _alien.mover(Movimento.baixo);
                    },
                    child: Image.asset("assets/icons/baixo.png")),
              ]),
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {
                      _alien.mover(Movimento.direita);
                    },
                    child: Image.asset("assets/icons/direita.png")),
                    
              ]),
              FlatButton(
                    onPressed: () {
                      menu.transicao(Tela.principal);
                    },
                    child: Image.asset("assets/icons/voltar.png")),
        ],
      
    );
  }
}
