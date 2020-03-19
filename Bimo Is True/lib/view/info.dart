import 'package:flutter/material.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu.dart';

class Info extends StatelessWidget {
  MenuState menu;

  Info(this.menu);

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
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Color(0xff269fbd),
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Informações",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          ),
          Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: Color(0xff269fbd),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                children: [
                  Text("Desenvolvedor: MaelSantos"),
                  Row(
                    children: [
                      Text("Contato: "),
                      InkWell(
                          child: Text("maelsantos777@gmail.com",
                              style: TextStyle(
                                  decorationColor: Colors.black,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 1)
                                  ],
                                  color: Color(0xff269fbd),
                                  decoration: TextDecoration.underline)),
                          onTap: () =>
                              launch("mailto: maelsantos777@gmail.com"))
                    ],
                  ),
                ],
              )),
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
