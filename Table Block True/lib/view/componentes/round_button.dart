import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String sourceImage;
  final Function onPressed;
  Rotation rotation;
  SizedBox _sizedBox;

  RoundButton(
      {this.onPressed, this.sourceImage, this.rotation = Rotation.vertical}) {
    if (rotation == Rotation.horizontal) {
      _sizedBox = SizedBox(width: 10);
    } else if (rotation == Rotation.vertical) {
      _sizedBox = SizedBox(height: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
            onPressed: onPressed,
            colorBrightness: Brightness.dark,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(sourceImage)),
        _sizedBox,
      ],
    );
  }
}

enum Rotation { vertical, horizontal }
