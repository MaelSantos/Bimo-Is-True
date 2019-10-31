import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/beans/usuario.dart';
import 'package:tableblocktrue/view/alerta.dart';
import 'package:tableblocktrue/view/cadastro.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
import 'package:tableblocktrue/view/componentes/text_component.dart';
import 'package:tableblocktrue/webservice/web_service.dart';

import 'menu.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  Cadastro _cadastro;
  TextEditingController controladorLogin;
  TextEditingController controladorSenha;
  GlobalKey<FormState> _formKey;

  TextCustom tfdLogin, tfdSenha;

  @override
  void initState() {
    super.initState();
    _cadastro = Cadastro();
    tfdLogin = TextCustom("Informe o Login");
    tfdSenha = TextCustom(
      "Informe a Senha",
      isPassword: true,
      mensagemErro: "Login ou senha incorretos",
    );

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
            key: _formKey,
            child: Center(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/back + logo.png"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.repeat,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff269fbd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23)),
                        ),
                        tfdLogin,
                        tfdSenha,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Usuario user = Usuario();
                                    user.login = tfdLogin.text;
                                    user.senha = tfdSenha.text;
                                    _showMenu(usuario: user);
                                  }
                                },
                                sourceImage:
                                    "assets/images/icons/confirmar.png",
                                division: 10),
                            RoundButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => _cadastro));
                                },
                                sourceImage: "assets/images/icons/mais.png",
                                division: 10),
                            RoundButton(
                              onPressed: () {
                                Alerta.alert(
                                    context, "Sair ?", "Deseja realmente sair?",
                                    function: () {
                                  SystemChannels.platform.invokeMethod(
                                      'SystemNavigator.pop'); //sai da aplicação
                                });
                              },
                              sourceImage: "assets/images/icons/sair.png",
                            ),
                          ],
                        )
                      ],
                    )))));
  }

  void _showMenu({Usuario usuario}) async {
    // Usuario user = await WebService.getUsuarioLoginSenha(usuario);
    // if (user == null) {
    //   tfdSenha.erro = true;
    //   _formKey.currentState.validate();
    // } else {
    //   user.ativo = true;
    //   // user.save();
    //   Navigator.pushReplacementNamed(context, '/Menu');
    // }
    Navigator.pushReplacementNamed(context, '/Menu');
  }
}
