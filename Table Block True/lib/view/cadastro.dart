import 'package:flutter/material.dart';
import 'package:tableblocktrue/beans/usuario.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
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
      resizeToAvoidBottomPadding: false,
        body: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
                padding: EdgeInsets.only(top: 240),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/back + logo.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                )),
                child: Center(
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: new Text("Cadastro")),
                      tfdNome,
                      tfdEmail,
                      tfdLogin,
                      tfdSenha,
                      tfdConfirmar,
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RoundButton(
                              onPressed: () {
                                if (tfdSenha.text == tfdConfirmar.text) {
                                  Usuario usuario = Usuario();
                                  usuario.nome = tfdNome.text.trim();
                                  usuario.login = tfdLogin.text.trim();
                                  usuario.senha = tfdSenha.text.trim();

                                  _formKey.currentState.validate();
                                  if (WebService.cadastroUsuario(usuario) !=
                                      null) {
                                    Navigator.pushReplacementNamed(
                                        context, '/Menu');
                                  }
                                  //else {exibir mensagem de erro}
                                } else {
                                  tfdConfirmar.erro = true;
                                  _formKey.currentState.validate();
                                }
                              },
                              sourceImage: "assets/images/icons/confirmar.png",
                              rotation: Rotation.horizontal),
                          RoundButton(
                              onPressed: () {
                                Navigator.pop(context, "Login");
                              },
                              sourceImage: "assets/images/icons/cancelar.png",
                              rotation: Rotation.horizontal),
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
