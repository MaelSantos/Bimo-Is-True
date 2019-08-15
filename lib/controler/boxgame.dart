import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game{

  Size screenSize;
  bool inJogo = false;

  @override
  void render(Canvas canvas) { //metodo para desenhar 
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint); 

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150
    );
    Paint boxPaint = Paint();
    if (inJogo) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(Colors.red.value);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) { //metodo para desenhar
    // TODO: implement update
  }
  
  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75
      && d.globalPosition.dx <= screenCenterX + 75
      && d.globalPosition.dy >= screenCenterY - 75
      && d.globalPosition.dy <= screenCenterY + 75
    ) {
      if(inJogo)
        inJogo = false;
      else
        inJogo = true;
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

}