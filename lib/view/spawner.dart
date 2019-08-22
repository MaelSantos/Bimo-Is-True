import 'package:log_man/controler/boxgame.dart';
import 'package:log_man/model/entidade.dart';

class FlySpawner {
  final BoxGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;
  int currentInterval;
  int nextSpawn;

  FlySpawner(this.game) {
    start();
    game.spawnFly();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.flies.forEach((Entidade fly) => fly.isVivo = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingFlies = 0;
    game.flies.forEach((Entidade fly) {
      if (!fly.isVivo) livingFlies += 1;
    });

    if (nowTimestamp >= nextSpawn && livingFlies < maxFliesOnScreen) {
      game.spawnFly();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}