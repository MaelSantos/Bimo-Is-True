import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/beans/usuario.dart';
import 'package:tableblocktrue/view/cadastro.dart';
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
    tfdSenha = TextCustom("Informe a Senha", isPassword: true, mensagemErro: "Login ou senha incorretos",);

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Form(
            key: _formKey,
            child: Container(
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
                    tfdLogin,
                    tfdSenha,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Usuario user = Usuario();
                                user.login = tfdLogin.text;
                                user.senha = tfdSenha.text;
                                _showMenu(usuario: user);
                              }
                            },
                            child: Image.asset(
                                "assets/images/icons/confirmar.png")),
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
