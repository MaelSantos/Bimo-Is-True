import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';
import 'package:log_man/view/menu.dart';

class Config extends StatefulWidget{

  MenuState menu;
  Config(this.menu);

  @override
  State<StatefulWidget> createState() {
    return ConfigState(menu);
  }

}

class ConfigState extends State<Config> {
  MenuState menu;
  double values = 0.0;

  ConfigState(this.menu);

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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Slider(
            value: values,
            min: 0,
            max: 10,
            onChanged: (va){
              setState(() {
                values = va;
              });
            },
          ),
          Slider(
            value: values,
            min: 0,
            max: 10,
            onChanged: (va){
              setState(() {
                values = va;
              });
            },
          ),
          FlatButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              child: Image.asset("assets/icons/home.png")),
          FlatButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              child: Image.asset("assets/icons/musicaOn.png")),
          FlatButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              child: Image.asset("assets/icons/salvar.png")),
        ],
      )),
    );
  }
}
