import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {

  String conteudo;
  final Function onPressed;

  ButtonCustom({this.conteudo="OK", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.lightBlue,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
        padding: EdgeInsets.only(left: 0),
        child: Text(
          conteudo,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed
      ),
    );
  }
}
