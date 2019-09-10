import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/menu.dart';

class Principal extends StatelessWidget {
  MenuState menu;
  Principal(this.menu);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
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
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.fase);
                },
                child: Image.asset("assets/icons/iniciar.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                child: Image.asset("assets/icons/config.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.ajuda);
                },
                child: Image.asset("assets/icons/ajuda.png")),
            FlatButton(
              onPressed: () {
                menu.transicao(Tela.info);
              },
              child: Image.asset("assets/icons/info.png"),
            ),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.sair);
                },
                child: Image.asset("assets/icons/sair.png")),
          ],
        ),
      ),
    );
  }
}
