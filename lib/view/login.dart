import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';

import 'menu.dart';

class Login extends StatelessWidget {
  MenuState menu;

  Login(this.menu);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(30.0),
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
                  Text("Login"),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        hintText: 'Informe o login'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        hintText: 'Informe a senha'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {
                            menu.transicao(Tela.principal);
                          },
                          child: Image.asset("assets/icons/confirmar.png")),
                      FlatButton(
                          onPressed: () {
                            menu.transicao(Tela.cadastro);
                          },
                          child: Image.asset("assets/icons/mais.png")),
                      FlatButton(
                          onPressed: () {
                            menu.transicao(Tela.sair);
                          },
                          child: Image.asset("assets/icons/sair.png")),
                    ],
                  )
                ],
              ),
            ));
  }
}
