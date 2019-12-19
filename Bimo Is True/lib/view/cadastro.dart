import 'package:flutter/material.dart';
import 'package:bimo_is_true/beans/usuario.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:bimo_is_true/view/componentes/text_component.dart';
import 'package:bimo_is_true/webservice/web_service.dart';

class Cadastro extends StatelessWidget {
  TextCustom tfdNome, tfdEmail, tfdLogin, tfdSenha, tfdConfirmar;
  GlobalKey<FormState> _formKey;

  Cadastro() {
    tfdNome = TextCustom("Informe seu nome", iconData: Icons.face,);
    tfdEmail = TextCustom("Informe o email", iconData: Icons.mail_outline,);
    tfdLogin = TextCustom("Informe o login", iconData: Icons.alternate_email);
    tfdSenha = TextCustom(
      "Informe a senha",
      isPassword: true,
      iconData: Icons.lock_outline
    );
    tfdConfirmar = TextCustom(
      "Confirme sua senha",
      isPassword: true,
      mensagemErro: "Senhas diferentes",
      iconData: Icons.lock_outline
    );

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
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
                    children: [
                      Center(
                        child: Container(
                          height: 50,
                          width: 315,
                          margin: EdgeInsets.only(
                            bottom: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Cadastro",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23)),
                        ),
                      ),
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
                                  usuario.ativo = true;

                                  _formKey.currentState.validate();
                                  // if (usuario.save() != null) {
                                  if (WebService.cadastroUsuario(usuario) != null) {
                                        usuario.save();
                                        print(usuario);
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
                              division: 10),
                          RoundButton(
                            onPressed: () {
                              Navigator.pop(context, "Login");
                            },
                            sourceImage: "assets/images/icons/cancelar.png",
                          ),
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
