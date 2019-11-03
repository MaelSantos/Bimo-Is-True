import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';

import 'menu.dart';

class Ajuda extends StatelessWidget {
  MenuState menu;

  Ajuda(this.menu);

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
          Container(
            height: 50,
            width: 190,
            margin: EdgeInsets.only(bottom: 10,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Color(0xff269fbd),
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Ajuda",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          ),
          RoundButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              sourceImage: "assets/images/icons/home.png"),
        ],
      )),
    ));
  }
}
