import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Entrada extends StatefulWidget {
  @override
  EntradaState createState() => EntradaState();
}

class EntradaState extends State<Entrada> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/Login');
  }

  startSplashScreenTimer() async {
    var _duration = Duration(seconds: 5); //duração de exibição
    return Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Image.asset("assets/icon.png", fit: BoxFit.fill))
          );
  }
}