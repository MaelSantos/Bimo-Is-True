import 'package:flutter/material.dart';
import 'package:tableblocktrue/view/componentes/button_custom.dart';

class Alerta {
  static bool _retorno = false;
  static bool get retorno => _retornoIn();
  static bool _retornoIn() {
    bool temp;
    if (_retorno)
      temp = true;
    else
      temp = false;
    _retorno = !_retorno;
    return temp;
  }

  static BuildContext context;

  static void _actionNao() {
    Navigator.pop(context);
  }

  static void alert(BuildContext context, String titulo, String msg,
      {Function function, Function function2 = _actionNao}) {
    Alerta.context = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
            // top: 20,
            // bottom: 20,
          ),
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width -60,
          decoration: BoxDecoration(
            color: Color(0xff269fbd),
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontFamily: "Special",
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: Center(
                    child: Text(
                      msg,
                      style: TextStyle(
                          fontFamily: "Special",
                          fontSize: 20,
                          color: Colors.white
                          ),
                    ),
                  )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ButtonCustom(
                      conteudo: "Não",
                      onPressed: function2,
                    ),
                    ButtonCustom(
                      conteudo: "Sim",
                      onPressed: function,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
