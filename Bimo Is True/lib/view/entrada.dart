import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:bimo_is_true/beans/usuario.dart';
import 'package:bimo_is_true/util/configUtil.dart';

class Entrada extends StatefulWidget {
  @override
  EntradaState createState() => EntradaState();
}

class EntradaState extends State<Entrada> {
  void navigationToNextPage() async {
    // Usuario user = await Usuario.getAtivo();
    // if (user == null) {
    //   Navigator.pushReplacementNamed(context, '/Login');
    // } else {
    //   ConfigUtil.userLogado = user;
    //   Navigator.pushReplacementNamed(context, '/Menu');
    // }
    // Navigator.pushReplacementNamed(context, '/Menu');
    Navigator.pushReplacementNamed(context, '/Intro');
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
        body: Center(child: Image.asset("assets/icon.png", fit: BoxFit.fill)));
  }
}
