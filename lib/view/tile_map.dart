import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:tableblocktrue/controler/game.dart';
import 'dart:ui' as ui;

class TileMap {
  /*
	 * Altura do seu TileMap
	 */
  double mapaAltura;
  /*
	 * Largura do seu TileMap
	 */
  double mapaLargura;
  /*
	 * Altura do seu TileSet
	 */
  double tileAltura;
  /*
	 * Largura do seu TileSet
	 */
  double tileLargura;

  /*
	 * Camada de inteiros(double) referente a sua camada 
	 */
  List<List<double>> camada;
  /*
	 * Largura da que seu TileMap(camada) ocupa na tela
	 */
  double larguraTela;
  /*
	 * Altura da que seu TileMap(camada) ocupa na tela
	 */
  double alturaTela;

  ui.Image tileSet;
  Image mapa;

  Canvas dbg;

  Sprite bgSprite;
  Rect bgRect;
  BoxGame game;

  TileMap(double mapaLargura, double mapaAltura, double tileLargura,
      double tileAltura, String nomeTileSet, String nomeMapaMatriz, this.game) {
    this.mapaLargura = mapaLargura;
    this.mapaAltura = mapaAltura;
    this.tileLargura = tileLargura;
    this.tileAltura = tileAltura;

    larguraTela = mapaLargura * tileLargura;
    alturaTela = mapaAltura * tileAltura;

    // mapa = Image(
    //   width: larguraTela,
    //   height: alturaTela,
    // );

    // tileSet = Image.asset(nomeTileSet);

    bgSprite = Sprite('sprite/tileset.png');

    // 1080 pixels ÷ 9 tiles = 120 pixels per tile
    // 2760 pixels ÷ 120 pixels per tile = 23 tiles
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 25),
      game.tileSize * 10, 
      game.tileSize * 23,
    );
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  void update(double t) {
    
    double tile;
    double tileRow;
    double tileCol;
    double colunasTileSet = tileSet.width/tileLargura;

    for (int i = 0; i < mapaLargura; i++) {
    	for (int j = 0; j < mapaAltura; j++) {
    		tile = (camada[i][j] != 0) ? (camada[i][j] - 1) : 0;
    		// tileRow = (tile / colunasTileSet) | 0;
    		// tileCol = (tile % colunasTileSet) | 0;
    		// dbg.drawImage(tileSet, (j * tileAltura), (i * tileLargura), (j * tileAltura) + tileAltura,
    		// 		(i * tileLargura) + tileLargura, (tileCol * tileAltura), (tileRow * tileLargura),
    		// 		(tileCol * tileAltura) + tileAltura, (tileRow * tileLargura) + tileLargura, null);
        bgRect = Rect.fromCenter(center: Offset(0, 0), height: 0, width: 0);
      }
    }
    // bgRect = Rect.fromLTWH(
    //   0,
    //   game.screenSize.height - (game.tileSize * 23),
    //   game.tileSize * 11,
    //   game.tileSize * 23,
    // );
    
  }

  montarMapa(Canvas canvas) {
    // double tile;
    // double tileRow;
    // double tileCol;
    // double colunasTileSet=tileSet.getWidth()/tileLargura;

    // for (double i = 0; i < mapaLargura; i++) {
    // 	for (double j = 0; j < mapaAltura; j++) {
    // 		tile = (camada[i][j] != 0) ? (camada[i][j] - 1) : 55;
    // 		tileRow = (tile / colunasTileSet) | 0;
    // 		tileCol = (tile % colunasTileSet) | 0;
    // 		dbg.drawImage(tileSet, (j * tileAltura), (i * tileLargura), (j * tileAltura) + tileAltura,
    // 				(i * tileLargura) + tileLargura, (tileCol * tileAltura), (tileRow * tileLargura),
    // 				(tileCol * tileAltura) + tileAltura, (tileRow * tileLargura) + tileLargura, null);
    // }

    // canvas.drawImage(tileSet, p, paint);
  }

  //metodo para gerar lista de rectangle para colisão
  //  List<Rectangle> montarColisao() {
  // 	List<Rectangle> tmp = new ArrayList<Rectangle>();
  // 	for (double i = 0; i < mapaLargura; i++) {
  // 		for (double j = 0; j < mapaAltura; j++) {
  // 			if(camada[i][j] != 0) {
  // 				tmp.add(new Rectangle( (j * tileAltura), (i * tileLargura), tileLargura, tileAltura));
  // 			}
  // 		}
  // 	}
  // 	return tmp;
  // }

  //  double[][] carregarMatriz(String nomeMapa) {
  // 	double[][] matz = new double[mapaLargura][mapaAltura];

  // 	InputStream input = getClass().getClassLoader().getResourceAsStream(nomeMapa);
  // 	BufferedReader br = new BufferedReader(new InputStreamReader(input));

  // 	List<String> linhas = new ArrayList<String>();
  // 	String linha = "";

  // 	try {
  // 		while ((linha = br.readLine()) != null)
  // 			linhas.add(linha);

  // 		double coluna = 0;
  // 		for (double i = 0; i < linhas.size(); i++) {
  // 			StringTokenizer token = new StringTokenizer(linhas.get(i), ",");

  // 			while (token.hasMoreElements()) {
  // 				matz[i][coluna] = Integer.parseInt(token.nextToken());
  // 				coluna++;
  // 			}
  // 			coluna = 0;
  // 		}

  // 	} catch (IOException e) {
  // 		System.out.println("Não carregou Matriz");
  // 		e.printStackTrace();
  // 	}

  // 	return matz;
  // }

  //  BufferedImage getMapa() {
  // 	return mapa;
  // }
  //  double getLarguraTela() {
  // 	return larguraTela;
  // }
  //  double getAlturaTela() {
  // 	return alturaTela;
  // }

}
