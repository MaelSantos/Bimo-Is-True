import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';

import 'menu.dart';

class Sobre extends StatelessWidget {
  MenuState menu;

  Sobre(this.menu);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/fundo.jpg"),
          //     repeat: ImageRepeat.repeat)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Sobre"),
          FlatButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              child: Image.asset("assets/icons/home.png")),
        ],
      )),
    );
  }
}
