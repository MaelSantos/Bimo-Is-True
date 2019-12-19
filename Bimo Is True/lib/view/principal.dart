import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bimo_is_true/beans/usuario.dart';
import 'package:bimo_is_true/util/configUtil.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/alerta.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:bimo_is_true/view/menu.dart';

class Principal extends StatelessWidget {
  MenuState menu;
  Principal(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(top: 160),
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/back_logo.png"),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          // repeat: ImageRepeat.repeat
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   child: Image.asset("assets/logo bimo.png"),
            // ),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.fase);
                },
                sourceImage: "assets/images/icons/iniciar.png"),
            // RoundButton(
            //   onPressed: () {
            //     menu.transicao(Tela.config);
            //   },
            //   sourceImage: "assets/images/icons/mais.png",
            // ),
            // RoundButton(
            //     onPressed: () {
            //       menu.transicao(Tela.config);
            //     },
            //     sourceImage: "assets/images/icons/pessoa.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.config);
                },
                sourceImage: "assets/images/icons/config.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.ajuda);
                },
                sourceImage: "assets/images/icons/ajuda.png"),
            RoundButton(
                onPressed: () {
                  menu.transicao(Tela.info);
                },
                sourceImage: "assets/images/icons/info.png"),
            RoundButton(
                onPressed: () {
                  // ConfigUtil.userLogado.ativo = false;
                  // ConfigUtil.userLogado.update();
                  // Usuario.removeAll();

                  // menu.transicao(Tela.login);
                  Alerta.alert(context, "Sair ?", "Deseja realmente sair?",
                      function: () {
                    SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop'); //sai da aplicação
                  });
                },
                sourceImage: "assets/images/icons/porta.png"),
          ],
        ),
      ),
    ));
  }
}
