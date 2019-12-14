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

  List tabela;
  TipoPreposicao tipoPreposicao = TipoPreposicao.e;
  List e = ["X","Y","X&Y",
            "V","V","V",
            "V","F","F",
            "F","V","F",
            "F","F","F"];

  List ou = ["X","Y","XvY",
             "V","V","V",
             "V","F","V",
             "F","V","V",
             "F","F","F"];

  List nao = ["X","X~","-",
              "V","F","-",
              "F","V", "-",];

  List se = ["X","Y","X->Y",
             "V","V","V",
             "V","F","F",
             "F","V","V",
             "F","F","V"];

  List somente = ["X","Y","X<->Y",
                  "V","V","V",
                  "V","F","F",
                  "F","V","F",
                  "F","F","V"];

  void mudarSelecao(TipoPreposicao selecionado) {
    setState(() {
      tipoPreposicao = selecionado;
      tabela = escolher();
      print(tabela);
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
          value: tipoPreposicao,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          // style: TextStyle(color: Colors.white),
        );

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/back.png"),
        alignment: Alignment.center,
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
          gerarTabelaVerdade(),
          RoundButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              sourceImage: "assets/images/icons/home.png"),
              SizedBox(height: 30,)
        ],
      )),
    ));
  }

  List escolher() {
    if (tipoPreposicao == TipoPreposicao.e) return e;
    if (tipoPreposicao == TipoPreposicao.ou) return ou;
    if (tipoPreposicao == TipoPreposicao.nao) return nao;
    if (tipoPreposicao == TipoPreposicao.se_entao) return se;
    if (tipoPreposicao == TipoPreposicao.se_somente_se) return somente;
  }

  Color gerarCor(int index) {
    Color cor;
    if (index < 3)
      cor = Colors.green[700];
    else 
    // if(index != 5 && index != 8 && index != 11 && index != 14)
      cor = Colors.green;
    // else
    //   cor = Colors.green[700];
    return cor;
  }

  Widget gerarTabelaVerdade() {
    tabela = escolher();

    return Expanded(
        child: SizedBox(
            height: 100.0,
            width: 350,
            child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(10),
                children: List.generate(tabela.length, (index) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: gerarCor(index),
                        border: Border.all(color: Colors.lightBlue, width: 1),
                      ),
                      child: Text(
                        "${tabela[index]}",
                        style: TextStyle(fontSize: 25),
                      ));
                }))));
  }
}
