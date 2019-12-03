import 'package:flutter/material.dart';
import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tela.dart';
import 'package:tableblocktrue/view/componentes/round_button.dart';
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
  Image audio, veloci;
  String musica;
  double get velocidade => FaseUtil.velocidade;
  double get volume => FaseUtil.volume;
  int get treino => FaseUtil.dificuldadeTreino;
  bool inVolume;
  double volumeAnterior = 0;

  ConfigState(this.menu);

  @override
  void initState() {
    super.initState();

    // velocidade = 50.0;
    inVolume = true;

    if (inVolume)
      musica = "assets/images/icons/musicaOn.png";
    else
      musica = "assets/images/icons/musicaOff.png";

    if (velocidade > 5.0)
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
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10.0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/back.png"),
            alignment: Alignment.center,
            // fit: BoxFit.fitWidth,
            repeat: ImageRepeat.repeat,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 190,
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Color(0xff269fbd),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Configurações",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    audio,
                    Slider(
                      activeColor: isAtivo(),
                      label: (volume * 100).toInt().toString() + "%",
                      value: volume,
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      onChanged: (va) {
                        setState(() {
                          if (inVolume) {
                            FaseUtil.volume = va;
                            if (va != 0)
                              audio = Image.asset(
                                  "assets/images/icons/audioOn.png");
                            else
                              audio = Image.asset(
                                  "assets/images/icons/audioOff.png");
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      veloci,
                      Slider(
                        activeColor: Colors.white,
                        label: (velocidade.toInt() * 10).toString() + "%",
                        value: velocidade,
                        min: 2,
                        max: 10,
                        divisions: 10,
                        onChanged: (va) {
                          setState(() {
                            FaseUtil.velocidade = va;
                            if (va > 5.0)
                              veloci = Image.asset(
                                  "assets/images/icons/velocidade.png");
                            else
                              veloci = Image.asset(
                                  "assets/images/icons/iniciar.png");
                          });
                        },
                      ),
                    ]),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/icons/estrela.png"),
                      Slider(
                        activeColor: Colors.white,
                        label: (treino).toString(),
                        value: treino.toDouble(),
                        min: 1,
                        max: 4,
                        divisions: 3,
                        onChanged: (va) {
                          setState(() {
                            FaseUtil.dificuldadeTreino = va.toInt();
                          });
                        },
                      ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundButton(
                      onPressed: () {
                        setState(() {
                          if (inVolume) {
                            musica = "assets/images/icons/musicaOff.png";
                            audio =
                                Image.asset("assets/images/icons/audioOff.png");
                            volumeAnterior = volume;
                            FaseUtil.volume = 0;
                            inVolume = false;
                          } else {
                            musica = "assets/images/icons/musicaOn.png";
                            audio =
                                Image.asset("assets/images/icons/audioOn.png");
                            FaseUtil.volume = volumeAnterior;
                            inVolume = true;
                          }
                        });
                      },
                      sourceImage: musica,
                      division: 10),
                  RoundButton(
                    onPressed: () {
                      menu.transicao(Tela.principal);
                    },
                    sourceImage: "assets/images/icons/home.png",
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Color isAtivo() {
    if (inVolume)
      return Colors.white;
    else
      return Colors.grey;
  }
}
