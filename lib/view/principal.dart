import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/menu.dart';

class Principal extends StatelessWidget {
  MenuState menu;
  Principal(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      // bottomNavigationBar: ,
      body: Container(
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
                child: Image.asset("assets/images/icons/iniciar.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                child: Image.asset("assets/images/icons/mais.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                child: Image.asset("assets/images/icons/pessoa.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                child: Image.asset("assets/images/icons/config.png")),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.ajuda);
                },
                child: Image.asset("assets/images/icons/ajuda.png")),
            FlatButton(
              onPressed: () {
                menu.transicao(Tela.info);
              },
              child: Image.asset("assets/images/icons/info.png"),
            ),
            FlatButton(
                onPressed: () {
                  menu.transicao(Tela.login);
                },
                child: Image.asset("assets/images/icons/porta.png")),
          ],
        ),
      ),
    ));
  }
}
