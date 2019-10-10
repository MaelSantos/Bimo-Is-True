import 'package:flutter/material.dart';
import 'package:tableblocktrue/view/componentes/text_component.dart';

class Cadastro extends StatelessWidget {
  TextCustom tfdNome, tfdEmail, tfdLogin, tfdSenha, tfdConfirmar;

  Cadastro() {
    tfdNome = TextCustom("Informe seu nome");
    tfdEmail = TextCustom("Informe o email");
    tfdLogin = TextCustom("Informe o login");
    tfdSenha = TextCustom("Informe a senha");
    tfdConfirmar = TextCustom("Confirme sua senha");
  }

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
                  tfdNome,
                  tfdEmail,
                  tfdLogin,
                  tfdSenha,
                  tfdConfirmar,
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
