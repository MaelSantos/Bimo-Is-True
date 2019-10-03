import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/cadastro.dart';

import 'menu.dart';

class Login extends StatelessWidget {

  Cadastro _cadastro;

  Login(){
    _cadastro = Cadastro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        // bottomNavigationBar: ,
        body: Container(
            padding: EdgeInsets.all(30.0),
            constraints: BoxConstraints.expand(),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/fundo.jpg"),
            //         repeat: ImageRepeat.repeat,)),
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
                            Navigator.pushReplacementNamed(context, '/Menu');
                          },
                          child:
                              Image.asset("assets/images/icons/confirmar.png")),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => _cadastro));
                          },
                          child: Image.asset("assets/images/icons/mais.png")),
                      FlatButton(
                          onPressed: () {
                            SystemChannels.platform.invokeMethod(
                                'SystemNavigator.pop'); //sai da aplicação
                          },
                          child: Image.asset("assets/images/icons/sair.png")),
                    ],
                  )
                ],
              ),
            )));
  }
}
