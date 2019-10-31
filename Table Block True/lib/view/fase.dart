import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
import 'package:tableblocktrue/view/menu.dart';

class Fase extends StatelessWidget {
  MenuState menu;
  int faseAtual = 0;

  Fase(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightBlue,
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
          children: List.generate(8, (index) {
            return
                // Center(
                //   child:
                // ListView(
                // scrollDirection: Axis.horizontal,
                // children: [
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(
                    onPressed: () {
                      menu.transicao(Tela.jogo);
                    },
                    sourceImage: imageFase(index)),
                Text("Fase ${index + 1}")
              ],
              // ),
            );
          })),
    )));
  }

  String imageFase(int index) {
    if (index <= faseAtual)
      return "assets/images/icons/livre.png";
    else
      return "assets/images/icons/bloqueado.png";
  }
}
