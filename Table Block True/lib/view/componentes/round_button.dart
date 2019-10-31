import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String sourceImage;
  final Function onPressed;
  double division;

  RoundButton({this.onPressed, this.sourceImage, this.division = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, right: division),
        child: RaisedButton(
          onPressed: onPressed,
          colorBrightness: Brightness.dark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image.asset(sourceImage),
        ));
  }
}
