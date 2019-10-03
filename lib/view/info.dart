import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';

import 'menu.dart';

class Info extends StatelessWidget {
  MenuState menu;

  Info(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      // bottomNavigationBar: ,
      body: Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/fundo.jpg"),
      //         repeat: ImageRepeat.repeat)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Informações"),
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
