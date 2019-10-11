import 'package:flutter/material.dart';
import 'package:tableblocktrue/beans/usuario.dart';
import 'package:tableblocktrue/view/componentes/text_component.dart';
import 'package:tableblocktrue/webservice/web_service.dart';

class Cadastro extends StatelessWidget {
  TextCustom tfdNome, tfdEmail, tfdLogin, tfdSenha, tfdConfirmar;
  GlobalKey<FormState> _formKey;

  Cadastro() {
    tfdNome = TextCustom("Informe seu nome");
    tfdEmail = TextCustom("Informe o email");
    tfdLogin = TextCustom("Informe o login");
    tfdSenha = TextCustom(
      "Informe a senha",
      isPassword: true,
    );
    tfdConfirmar = TextCustom(
      "Confirme sua senha",
      isPassword: true,
      mensagemErro: "Senhas diferentes",
    );

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        // bottomNavigationBar: ,
        // appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: Container(
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
                                if (tfdSenha.text == tfdConfirmar.text) {
                                  Usuario usuario = Usuario();
                                  usuario.nome = tfdNome.text.trim();
                                  usuario.login = tfdLogin.text.trim();
                                  usuario.senha = tfdSenha.text.trim();

                                  _formKey.currentState.validate();
                                  if (WebService.cadastroUsuario(usuario) != null) {
                                    Navigator.pushReplacementNamed(context, '/Menu');
                                  }
                                  //else {exibir mensagem de erro}
                                } else {
                                  tfdConfirmar.erro = true;
                                  _formKey.currentState.validate();
                                }
                              },
                              child: Image.asset(
                                  "assets/images/icons/confirmar.png")),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context, "Login");
                              },
                              child: Image.asset(
                                  "assets/images/icons/cancelar.png")),
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
