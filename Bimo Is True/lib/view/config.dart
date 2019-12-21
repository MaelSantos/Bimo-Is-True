import 'package:bimo_is_true/beans/configuracao.dart';
import 'package:flutter/material.dart';
import 'package:bimo_is_true/util/configUtil.dart';
import 'package:bimo_is_true/util/faseUtil.dart';
import 'package:bimo_is_true/util/tela.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:bimo_is_true/view/menu.dart';

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
  ConfigUtil configUtil = ConfigUtil();
  Image audio, veloci;
  String musica;

  ConfigState(this.menu){
    initConfig();
  }

  @override
  void initState() {
    super.initState();
  }

  void initConfig() async {
    
    if (configUtil.configuracao.inVolume)
      musica = "assets/images/icons/musicaOn.png";
    else
      musica = "assets/images/icons/musicaOff.png";

    if (configUtil.configuracao.velocidade > 5.0)
      veloci = Image.asset("assets/images/icons/velocidade.png");
    else
      veloci = Image.asset("assets/images/icons/iniciar.png");

    if (configUtil.configuracao.volume != 0)
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
                      label: (configUtil.configuracao.volume * 100).toInt().toString() + "%",
                      value: configUtil.configuracao.volume,
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      onChanged: (va) {
                        setState(() {
                          if (configUtil.configuracao.inVolume) {
                            configUtil.configuracao.volume = va;
                            if (va != 0)
                              audio = Image.asset(
                                  "assets/images/icons/audioOn.png");
                            else
                              audio = Image.asset(
                                  "assets/images/icons/audioOff.png");
                            configUtil.configuracao.update();
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
                        label: (configUtil.configuracao.velocidade.toInt() * 10).toString() + "%",
                        value: configUtil.configuracao.velocidade,
                        min: 2,
                        max: 10,
                        divisions: 10,
                        onChanged: (va) {
                          setState(() {
                            configUtil.configuracao.velocidade = va;
                            if (va > 5.0)
                              veloci = Image.asset(
                                  "assets/images/icons/velocidade.png");
                            else
                              veloci = Image.asset(
                                  "assets/images/icons/iniciar.png");
                            configUtil.configuracao.update();
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
                        label: (configUtil.configuracao.dificuldadeTreino).toString(),
                        value: configUtil.configuracao.dificuldadeTreino.toDouble(),
                        min: 1,
                        max: 4,
                        divisions: 3,
                        onChanged: (va) {
                          setState(() {
                            configUtil.configuracao.dificuldadeTreino = va.toInt();
                            configUtil.configuracao.update();
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
                          if (configUtil.configuracao.inVolume) {
                            musica = "assets/images/icons/musicaOff.png";
                            audio =
                                Image.asset("assets/images/icons/audioOff.png");
                            configUtil.configuracao.volumeAnterior = configUtil.configuracao.volume;
                            configUtil.configuracao.volume = 0;
                            configUtil.configuracao.inVolume = false;
                          } else {
                            musica = "assets/images/icons/musicaOn.png";
                            audio =
                                Image.asset("assets/images/icons/audioOn.png");
                            configUtil.configuracao.volume = configUtil.configuracao.volumeAnterior.toDouble();
                            configUtil.configuracao.inVolume = true;
                          }
                          configUtil.configuracao.update();
                          print(configUtil.configuracao);
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
    if (configUtil.configuracao.inVolume)
      return Colors.white;
    else
      return Colors.grey;
  }
}
