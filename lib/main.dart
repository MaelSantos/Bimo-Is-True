//imports do flutter
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/components/tiled_component.dart';
import 'package:flame/game.dart';
import 'package:tableblocktrue/view/entrada.dart';

//meus imports
import 'view/menu.dart';

void main() async {
  // carrega as imagens em cache
  Flame.images.loadAll(<String>[
    "sprite/bege_padrao.png",
    "sprite/bege_direita1.png",
    "sprite/bege_direita2.png",
  ]);

  // final TiledGame game = TiledGame();
  // runApp(game.widget);
  runApp(MyApp()); //rodo a aplicação
}

class TiledGame extends BaseGame {
  TiledGame() {
    add(TiledComponent("teste.tmx"));
    // add(TiledComponent("mapa_1.tmx"));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // O widget Scaffold define o layouta da home
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Times", //define a fonte familia do texto
            textTheme: TextTheme(
              body1: TextStyle(
                  color: Colors.white, fontSize: 16), //define a cor padrão dos textos
            )),
        home: Entrada(),
        routes: {'/Menu': (BuildContext context) => Menu(),
        });
  }
}
