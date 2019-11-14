import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';

import 'menu.dart';

class Ajuda extends StatefulWidget {
  MenuState menu;
  Ajuda(this.menu);

  @override
  State<StatefulWidget> createState() => AjudaState(menu);
}

class AjudaState extends State<Ajuda> {
  MenuState menu;

  AjudaState(this.menu);

  TipoPreposicao bandeira = TipoPreposicao.e;

  void mudarSelecao(TipoPreposicao selecionado) {
    setState(() {
      bandeira = selecionado;
    });
  }

  @override
  Widget build(BuildContext context) {
    DropdownButton _down() => DropdownButton<TipoPreposicao>(
          items: [
            DropdownMenuItem(
              value: TipoPreposicao.e,
              child: Text("E"),
            ),
            DropdownMenuItem(
              value: TipoPreposicao.ou,
              child: Text("Ou"),
            ),
            DropdownMenuItem(
              value: TipoPreposicao.nao,
              child: Text("Negação"),
            ),
            DropdownMenuItem(
              value: TipoPreposicao.se_entao,
              child: Text("Se Então"),
            ),
            DropdownMenuItem(
              value: TipoPreposicao.se_somente_se,
              child: Text("Se Somente Se"),
            ),
          ],
          onChanged: mudarSelecao,
          value: bandeira,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          style: TextStyle(
              color: Colors.white),
        );

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/back.png"),
        alignment: Alignment.center,
        // fit: BoxFit.fitWidth,
        repeat: ImageRepeat.repeat,
      )),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 190,
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Ajuda",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _down(),
          ),
          RoundButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              sourceImage: "assets/images/icons/home.png"),
        ],
      )),
    ));
  }
}
