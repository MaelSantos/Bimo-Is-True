import 'package:firebase_admob/firebase_admob.dart';

class Propaganda {
  static InterstitialAd myInterstitial;
  static int cont = 0;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      'pokémon',
      'games',
      'jogos',
      'freefire',
      'digimon',
      'evolution',
      'evolução',
      'mario',
      'sonic',
      'tabela verdade',
      'logica',
      'educação',
      'education'
    ],
    // childDirected: true, //publico infantil
  );

  static InterstitialAd buildInterstitial() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-4785348218475505/1222603982",
        // adUnitId: InterstitialAd.testAdUnitId,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myInterstitial?.show();
          }
          if (event == MobileAdEvent.clicked || event == MobileAdEvent.closed) {
            myInterstitial.dispose();
          }
        });
  }

  static displayInterstitial() {
    myInterstitial = buildInterstitial()
      ..load()
      ..show();
  }

  static void popUp() {
    // print(cont);
    if (cont >= 5) {
      displayInterstitial();
      cont = 0;
    } else
      cont++;
  }

  static void dispose() {
    myInterstitial?.dispose();
  }
}
