import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/menu.dart';

class Fase extends StatelessWidget {
  MenuState menu;

  Fase(this.menu);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/fundo.jpg"),
      //         repeat: ImageRepeat.repeat)),
      child: Center(
          child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.jogo);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 1")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 2")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 3")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 4")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 5")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 6")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 7")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    menu.transicao(Tela.principal);
                  },
                  child: Image.asset("assets/icons/home.png")),
              Text("Fase 8")
            ],
          ),
        ],
      )),
    );
  }
}
