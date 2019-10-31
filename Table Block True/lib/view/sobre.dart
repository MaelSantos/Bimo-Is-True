import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';

import 'menu.dart';

class Sobre extends StatelessWidget {
  MenuState menu;

  Sobre(this.menu);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/back.png"),
            alignment: Alignment.center,
            // fit: BoxFit.fitWidth,
            repeat: ImageRepeat.repeat,
          )),
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
                  child: Image.asset("assets/images/icons/home.png")),
            ],
          )),
        ));
  }
}
