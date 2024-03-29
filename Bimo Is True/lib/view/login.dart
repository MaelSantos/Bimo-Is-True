import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bimo_is_true/beans/usuario.dart';
import 'package:bimo_is_true/util/configUtil.dart';
import 'package:bimo_is_true/view/alerta.dart';
import 'package:bimo_is_true/view/cadastro.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:bimo_is_true/view/componentes/text_component.dart';
import 'package:bimo_is_true/webservice/web_service.dart';

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
    tfdLogin = TextCustom("Informe o Login", iconData: Icons.alternate_email);
    tfdSenha = TextCustom(
      "Informe a Senha",
      isPassword: true,
      mensagemErro: "Login ou senha incorretos",
      iconData: Icons.lock_outline
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
                padding: EdgeInsets.all(10.0),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/back + logo.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                )),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                      child: Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23)),
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
                            sourceImage: "assets/images/icons/confirmar.png",
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
    Usuario user = await WebService.getUsuarioLoginSenha(usuario);
    if (user == null) {
      tfdSenha.erro = true;
      _formKey.currentState.validate();
    } else {
      user.ativo = true;
      user.save();
      // user.update();
      Navigator.pushReplacementNamed(context, '/Menu');
    }
    // Navigator.pushReplacementNamed(context, '/Menu');

// print(usuario);
//     Usuario user = await Usuario.getLogin(usuario.login, usuario.senha);
//     print(user);
//     if (user == null) {
//       tfdSenha.erro = true;
//       _formKey.currentState.validate();
//     } else {
//       user.ativo = true;
//       user.update();
//       ConfigUtil.userLogado = usuario;
//       Navigator.pushReplacementNamed(context, '/Menu');
//       // user.save();
//     }
  }
}
