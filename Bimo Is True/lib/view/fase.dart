import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
import 'package:tableblocktrue/view/menu.dart';

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
      child: GridView.count(
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
                          if(FaseUtil.faseAtual >= index){
                          FaseUtil.pontuacao = 0;
                          menu.transicao(Tela.jogo);
                          FaseUtil.faseJogar = index;
                          }
                        },
                        child: Image.asset(
                          imageFase(index),
                        )),
                    Text(textoFase(index))
                  ],
                  // ),
                ));
          })),
    )));
  }

  String imageFase(int index) {
    if (index <= FaseUtil.faseAtual)
      return "assets/images/icons/livre.png";
    else
      return "assets/images/icons/bloqueado.png";
  }

  String textoFase(int index) {
    if (index == 0)
      return "Modo Loop";
    else
      return "Fase $index";
  }
}
