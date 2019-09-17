import 'package:flutter/material.dart';
import 'package:log_man/util/tela.dart';

import 'menu.dart';

class Cadastro extends StatelessWidget {
  MenuState menu;

  Cadastro(this.menu);

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
                  Text("Cadastro"),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person),
                        hintText: 'Informe seu nome'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email),
                        hintText: 'Informe seu email'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.account_box),
                        hintText: 'Informe o login'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        hintText: 'Informe a senha'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        hintText: 'Confirme sua senha'),
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
                            menu.transicao(Tela.login);
                          },
                          child: Image.asset("assets/icons/cancelar.png")),
                    ],
                  )
                ],
              ),
            ));
  }
}
