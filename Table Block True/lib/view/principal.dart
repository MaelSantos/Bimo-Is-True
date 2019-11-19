import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/configUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
import 'package:tableblocktrue/view/menu.dart';

class Principal extends StatelessWidget {
  MenuState menu;
  Principal(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(top: 160),
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back + logo.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                // repeat: ImageRepeat.repeat
                )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   child: Image.asset("assets/logo bimo.png"),
            // ),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.fase);
                },
                sourceImage: "assets/images/icons/iniciar.png"),
            // RoundButton(
            //   onPressed: () {
            //     menu.transicao(Tela.config);
            //   },
            //   sourceImage: "assets/images/icons/mais.png",
            // ),
            // RoundButton(
            //     onPressed: () {
            //       menu.transicao(Tela.config);
            //     },
            //     sourceImage: "assets/images/icons/pessoa.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                sourceImage: "assets/images/icons/config.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.ajuda);
                },
                sourceImage: "assets/images/icons/ajuda.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.info);
                },
                sourceImage: "assets/images/icons/info.png"),
            RoundButton(
                onPressed: () {
                  ConfigUtil.userLogado.ativo = false;
                  ConfigUtil.userLogado.update();
                  
                  menu.transicao(Tela.login);
                },
                sourceImage: "assets/images/icons/porta.png"),
          ],
        ),
      ),
    ));
  }
}
