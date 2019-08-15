import 'package:flutter/material.dart';

class Principal extends StatelessWidget{

  int tela = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          RaisedButton(
            onPressed: null,
            textTheme: ButtonTextTheme.primary,
            padding: EdgeInsets.all(0.0),
            child: Image.asset("assets/icons/iniciar.png")),
          RaisedButton(
              onPressed: null,
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(0.0),
              child: Image.asset("assets/icons/config.png")),
          RaisedButton(
              onPressed: null,
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(0.0),
              child: Image.asset("assets/icons/ajuda.png")),
          RaisedButton(
              onPressed: null,
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(0.0),
              child: Image.asset("assets/icons/info.png")),
          RaisedButton(
              onPressed: null,
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(0.0),
              child: Image.asset("assets/icons/sair.png")),
        ],
      ),
    );
  }

}
