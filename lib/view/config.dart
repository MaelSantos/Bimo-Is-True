import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/menu.dart';

class Config extends StatefulWidget {
  MenuState menu;
  Config(this.menu);

  @override
  State<StatefulWidget> createState() {
    return ConfigState(menu);
  }
}

class ConfigState extends State<Config> {
  MenuState menu;
  Image musica, audio, veloci;
  double velocidade;
  double volume;
  bool inVolume;

  ConfigState(this.menu);

  @override
  void initState() {
    super.initState();

    velocidade = 50.0;
    volume = 50.0;
    inVolume = true;

    if (inVolume)
      musica = Image.asset("assets/images/icons/musicaOn.png");
    else
      musica = Image.asset("assets/images/icons/musicaOff.png");

    if (velocidade > 50.0)
      veloci = Image.asset("assets/images/icons/velocidade.png");
    else
      veloci = Image.asset("assets/images/icons/iniciar.png");

    if (volume != 0)
      audio = Image.asset("assets/images/icons/audioOn.png");
    else
      audio = Image.asset("assets/images/icons/audioOff.png");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/images/fundo.jpg"),
      //         repeat: ImageRepeat.repeat)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              audio,
              Slider(
                activeColor: Colors.indigoAccent,
                label: volume.toInt().toString() + "%",
                value: volume,
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (va) {
                  setState(() {
                    volume = va;
                    if (va != 0)
                      audio = Image.asset("assets/images/icons/audioOn.png");
                    else
                      audio = Image.asset("assets/images/icons/audioOff.png");
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              veloci,
              Slider(
                activeColor: Colors.indigoAccent,
                label: velocidade.toInt().toString() + "%",
                value: velocidade,
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (va) {
                  setState(() {
                    velocidade = va;
                    if (va > 50.0)
                      veloci = Image.asset("assets/images/icons/velocidade.png");
                    else
                      veloci = Image.asset("assets/images/icons/iniciar.png");
                  });
                },
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              setState(() {});

              if (inVolume) {
                musica = Image.asset("assets/images/icons/musicaOn.png");
                inVolume = false;
              } else {
                musica = Image.asset("assets/images/icons/musicaOff.png");
                inVolume = true;
              }
            },
            child: musica,
          ),
          FlatButton(
              onPressed: () {
                menu.transicao(Tela.principal);
              },
              child: Image.asset("assets/images/icons/home.png")),
        ],
      )),
    );
  }
}
