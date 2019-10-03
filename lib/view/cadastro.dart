import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';

import 'menu.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        // bottomNavigationBar: ,
        // appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(30.0),
            constraints: BoxConstraints.expand(),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/fundo.png"),
            //         repeat: ImageRepeat.repeat
            //         )),
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
                            Navigator.pushReplacementNamed(context, '/Menu');
                          },
                          child:
                              Image.asset("assets/images/icons/confirmar.png")),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context, "Login");
                          },
                          child:
                              Image.asset("assets/images/icons/cancelar.png")),
                    ],
                  )
                ],
              ),
            )));
  }
}
