import 'package:bimo_is_true/view/tabela_ajuda.dart';
import 'package:flutter/material.dart';

import '../util/tela.dart';
import 'componentes/round_button.dart';
import 'menu.dart';

class Ajuda extends StatefulWidget {
  MenuState menu;
  Ajuda(this.menu);

  @override
  State<StatefulWidget> createState() => AjudaState(menu);
}

class AjudaState extends State<Ajuda> {
  MenuState menu;

  AjudaState(this.menu);

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
        repeat: ImageRepeat.repeat,
      )),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TabelaAjuda(),
                  // Container(
                  //   padding: EdgeInsets.all(100),
                  //   child: Center(child: Image.asset("assets/storyboard.png")),
                  // ),
                ],
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 190,
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Ajuda",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(
                    onPressed: () {
                      menu.transicao(Tela.principal);
                    },
                    sourceImage: "assets/images/icons/home.png", division: 10,),
                RoundButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Intro');
                    },
                    sourceImage: "assets/images/icons/inform.png"),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
