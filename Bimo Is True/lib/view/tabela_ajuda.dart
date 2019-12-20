import 'package:bimo_is_true/util/tipos_preposicao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabelaAjuda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabelaAjudaState();

}

class TabelaAjudaState extends State<TabelaAjuda> {
  List tabela;
  TipoPreposicao tipoPreposicao = TipoPreposicao.e;
  List e = ["X","&","Y","=","X&Y",
            "V","&","V","=","V",
            "V","&","F","=","F",
            "F","&","V","=","F",
            "F","&","F","=","F"];

  List ou = ["X","v","Y","=","XvY",
             "V","v","V","=","V",
             "V","v","F","=","V",
             "F","v","V","=","V",
             "F","v","F","=","F"];

  List nao = ["X","~","=","X~","",
              "V","~","=","F","",
              "F","~","=","V", "",];

  List se = ["X","->","Y","=","X->Y",
             "V","->","V","=","V",
             "V","->","F","=","F",
             "F","->","V","=","V",
             "F","->","F","=","V"];

  List somente = ["X","<->","Y","=","X<->Y",
                  "V","<->","V","=","V",
                  "V","<->","F","=","F",
                  "F","<->","V","=","F",
                  "F","<->","F","=","V"];

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

    return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _down(),
              ),
              gerarTabelaVerdade(),
            ],
          ),
    );
  }

  List escolher() {
    if (tipoPreposicao == TipoPreposicao.e) return e;
    if (tipoPreposicao == TipoPreposicao.ou) return ou;
    if (tipoPreposicao == TipoPreposicao.nao) return nao;
    if (tipoPreposicao == TipoPreposicao.se_entao) return se;
    if (tipoPreposicao == TipoPreposicao.se_somente_se) return somente;
    return null;
  }

  Color gerarCor(int index) {
    Color cor;
    if (index < 5)
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
            width: 370,
            child: GridView.count(
                crossAxisCount: 5,
                padding: EdgeInsets.all(10),
                children: List.generate(tabela.length, (index) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: gerarCor(index),
                        border: Border.all(color: Colors.lightBlue, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${tabela[index]}",
                        style: TextStyle(fontSize: 25),
                      ));
                }))));
  }
}
