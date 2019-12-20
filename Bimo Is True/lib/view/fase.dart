import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:flutter/material.dart';
import 'package:bimo_is_true/util/faseUtil.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/menu.dart';
import 'package:flutter/rendering.dart';

class Fase extends StatelessWidget {
  MenuState menu;
  Fase(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                constraints: BoxConstraints.expand(),
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/back.png"),
                  alignment: Alignment.center,
                  // fit: BoxFit.fitWidth,
                  repeat: ImageRepeat.repeat,
                )),
                child: Stack(
                  children: [
                    GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(5, (index) {
                          return Container(
                              alignment: Alignment.center,
                              // color: Colors.green,
                              // padding: EdgeInsets.only(top: 40),
                              margin: EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.lightBlue, width: 5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      onPressed: () {
                                        if (FaseUtil.faseAtual >= index) {
                                          FaseUtil.pontuacao = 0;
                                          FaseUtil.faseJogar = index;
                                          menu.transicao(Tela.jogo);
                                        }
                                      },
                                      child: Image.asset(
                                        imageFase(index),
                                      )),
                                  Text(textoFase(index)),
                                ],
                                // ),
                              ));
                        })),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RoundButton(
                          onPressed: () {
                            menu.transicao(Tela.sair);
                          },
                          sourceImage: "assets/images/icons/home.png"),
                    ),
                  ],
                ))));
  }

  String imageFase(int index) {
    if (index == 0) return "assets/images/icons/estrela.png";
    if (index <= FaseUtil.faseAtual)
      return "assets/images/icons/livre.png";
    else
      return "assets/images/icons/bloqueado.png";
  }

  String textoFase(int index) {
    if (index == 0)
      return "Treino";
    else
      return "Fase $index";
  }
}
