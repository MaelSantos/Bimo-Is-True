import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:tableblocktrue/view/inventario.dart';
import 'package:tableblocktrue/view/menu.dart';
import 'package:tiler/tiler.dart';

class Camada extends StatefulWidget {
  final String mapFile;
  final Inventario inventario;
  final MenuState menu;
  CamadaState camadaState;

  Camada(this.mapFile, this.menu, this.inventario){
    camadaState = CamadaState(mapFile, menu, inventario);
  }

  @override
  CamadaState createState() => CamadaState(mapFile, menu, inventario);
}

class CamadaState extends State<Camada> {
  String mapFile;
  Inventario inventario;
  MenuState menu;

  Future<LoadedTileMap> tileMap;
  Offset offset = Offset.zero;
  Stopwatch sw = Stopwatch()..start();

  CamadaState(this.mapFile, this.menu, this.inventario);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<LoadedTileMap>(
      future: tileMap,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final loadedMap = snapshot.data;
          final map = loadedMap.map;
          return Column(
            children: [
              TileMap(
                loadedMap,
                offset,
                Size(
                  (map.width * map.tileWidth).toDouble(),
                  (map.height * map.tileHeight).toDouble(),
                ),
                // scale: 0.5,
                // elapsedMilliseconds: sw.elapsedMilliseconds,
                // debugMode: true,
              ),
              inventario,
            ],
          );
        } else if (snapshot.hasError) {
          return Text('ERROR LOADING MAP: ${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    tileMap = loadMap(rootBundle, mapFile);
  }

  @override
  void deactivate() {
    super.deactivate();
    sw.stop();
  }
}
