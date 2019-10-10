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
  bool flagErro;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextCustom tfdLogin, tfdSenha;

  @override
  void initState() {
    super.initState();
    _cadastro = Cadastro();
    tfdLogin = TextCustom("Informe o Login");
    tfdSenha = TextCustom("Informe a Senha");

    controladorLogin = TextEditingController();
    controladorSenha = TextEditingController();
    flagErro = false;
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        // bottomNavigationBar: ,
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
                              flagErro = false;
                              if (_formKey.currentState.validate()) {
                                Usuario user = Usuario();
                                user.login = tfdLogin.text;
                                user.senha = tfdSenha.text;
                                // user.login = controladorLogin.text.trim();
                                // user.senha = controladorSenha.text.trim();
                                _showDashBoard(usuario: user);
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

  void _showDashBoard({Usuario usuario}) async {
    Usuario user = await WebService.getUsuarioLoginSenha(usuario);
    if (user == null) {
      tfdSenha.erro = true;
      // flagErro = true;
      _formKey.currentState.validate();
    } else {
      user.ativo = true;
      // user.save();
      print("ok");
      Navigator.pushReplacementNamed(context, '/Menu');
    }
  }
}
