import 'package:flutter/material.dart';

// class TextCustom extends StatefulWidget {
//   String texto;
//   TextCustom(this.texto);

//   @override
//   State<StatefulWidget> createState() => TextCustomState(texto);
// }

class TextCustom extends StatelessWidget {

  TextEditingController controlador;
  String texto;
  bool erro;
  String mensagemErro;
  Icon icone;

  TextCustom(this.texto, {this.mensagemErro="Dados invalidos", IconData iconData = Icons.person}) {

    icone = Icon(iconData);
    erro = false;
    controlador = TextEditingController();
  }

  String get text => controlador.text.trim();

  @override
  Widget build(BuildContext context) {
    return component(context);
  }

  String validar(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return "Campo Obrigatório";
    }
    else if(erro)
    {
      return mensagemErro;
    }
    return null;
  }

  Widget component(BuildContext context) {
    return Container(
        // height: 70,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10),
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 60,
            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            child: TextFormField(
              controller: controlador,
              validator: validar,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: icone,
                  hintText: texto),
            ),
          )
        ]));
  }
}
