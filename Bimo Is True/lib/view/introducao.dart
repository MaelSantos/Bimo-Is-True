import 'package:bimo_is_true/util/configUtil.dart';
import 'package:bimo_is_true/view/componentes/round_button.dart';
import 'package:flutter/material.dart';

class Introducao extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntroducaoState();
}

class IntroducaoState extends State<Introducao> {
  
  ConfigUtil configUtil = ConfigUtil();

  PageController controll;
  String icone;
  int pagina;
  String explicacao;

  @override
  void initState() {
    pagina = 0;
    controll = PageController(initialPage: pagina);
    icone = "assets/images/icons/direita.png";
    explicacao =
        "Mova o personagem utilizando o joystick até tocar em um bloco (preposição)";
    super.initState();
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
              repeat: ImageRepeat.repeat,
            )),
            child: Stack(
              children: [
                PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controll,
                  children: [
                    Image.asset("assets/intro_1.jpg", fit: BoxFit.cover),
                    Image.asset("assets/intro_2.jpg", fit: BoxFit.cover),
                    Image.asset("assets/intro_3.jpg", fit: BoxFit.cover),
                    Image.asset("assets/intro_4.jpg", fit: BoxFit.cover),
                    Image.asset("assets/intro_5.jpg", fit: BoxFit.cover),
                    Image.asset("assets/intro_6.jpg", fit: BoxFit.cover),
                  ],
                  onPageChanged: (int i) {
                    setState(() {
                      pagina = i;
                      if (i == 5)
                        icone = "assets/images/icons/confirmar.png";
                      else
                        icone = "assets/images/icons/direita.png";

                      switch (i) {
                        case 0:
                          explicacao =
                              "Mova o personagem utilizando o joystick até tocar em um bloco (preposição)";
                          break;
                        case 1:
                          explicacao =
                              "Selecione o bloco utilizando o botão da 'mão'";
                          break;
                        case 2:
                          explicacao =
                              "Mova o bloco selecionado até o final do labirinto";
                          break;
                        case 3:
                          explicacao =
                              "Ao final se encontra uma preposição/problema da tabela verdade";
                          break;
                        case 4:
                          explicacao =
                              "Se o bloco (preposição) solucionar o problema a fase é concluída prosseguindo para próxima";
                          break;
                        case 5:
                          explicacao =
                              "Em problemas de proposições maiores é necessário mais de um bloco para solucionar o problema";
                          break;
                        default:
                      }
                    });
                  },
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 200,
                      width: 190,
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(explicacao,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23)),
                    )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RoundButton(
                      onPressed: () {
                        if (pagina != 5)
                          controll.nextPage(
                              curve: Curves.easeInBack,
                              duration: Duration(seconds: 1));
                        else
                          fecharIntroducao();
                      },
                      sourceImage: icone),
                )
              ],
            )));
  }

  void fecharIntroducao(){
    configUtil.configuracao.introducao = false;
    configUtil.configuracao.update();
    Navigator.pushReplacementNamed(context, '/Menu');
  }
}
