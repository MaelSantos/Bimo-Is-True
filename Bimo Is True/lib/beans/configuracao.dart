import 'package:bimo_is_true/util/Sqlite/tabela_configuracao.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:bimo_is_true/util/Sqlite/SqLite.dart';

class Configuracao {
  int id;
  bool introducao = true;
  bool inVolume = true;
  double velocidade = 9;
  double volume = 1.0;
  double volumeAnterior = 0;
  int dificuldadeTreino = 1;
  int faseAtual = 1;

  Configuracao();

  @override
  String toString() {
    return 'Configuracao{id: $id, introducao: $introducao, inVolume: $inVolume, velocidade: $velocidade, volume: $volume, volumeAnterior: $volumeAnterior, dificuldadeTreino: $dificuldadeTreino, faseAtual: $faseAtual}';
  }

  Configuracao.fromMapWeb(Map map) {
    id = map["id"];
    introducao = map["introducao"];
    inVolume = map["inVolume"];
    velocidade = map["velocidade"];
    volume = map["volume"];
    volumeAnterior = map["volumeAnterior"];
    dificuldadeTreino = map["dificuldadeTreino"];
    faseAtual = map["faseAtual"];
  }

  Configuracao.fromMapSqLite(Map map) {
    id = map[TabelaConfiguracao.COL_ID];
    introducao = map[TabelaConfiguracao.COL_INTRODUCAO] == 1
        ? introducao = true
        : introducao = false;
    inVolume = map[TabelaConfiguracao.COL_IN_VOLUME] == 1
        ? inVolume = true
        : inVolume = false;
    velocidade = map[TabelaConfiguracao.COL_VELOCIDADE];
    volume = map[TabelaConfiguracao.COL_VOLUME];
    volumeAnterior = map[TabelaConfiguracao.COL_VOLUME_ANTERIOR].toDouble();
    dificuldadeTreino = map[TabelaConfiguracao.COL_DIFICULDADE_TREINO];
    faseAtual = map[TabelaConfiguracao.COL_FASE_ATUAL];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      TabelaConfiguracao.COL_ID: id,
      TabelaConfiguracao.COL_INTRODUCAO: introducao,
      TabelaConfiguracao.COL_IN_VOLUME: inVolume,
      TabelaConfiguracao.COL_VELOCIDADE: velocidade,
      TabelaConfiguracao.COL_VOLUME: volume,
      TabelaConfiguracao.COL_VOLUME_ANTERIOR: volumeAnterior,
      TabelaConfiguracao.COL_DIFICULDADE_TREINO: dificuldadeTreino,
      TabelaConfiguracao.COL_FASE_ATUAL: faseAtual,
    };
    return map;
  }

  Future<int> save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaConfiguracao.NOME_TABELA, toMap());
    print("SALVO - VALOR $valor");
    return valor;
  }

  Future<Configuracao> update() async {
    Database dataBase = await SqlHelper().db;
    List listMapConfig =
        await dataBase.rawQuery(TabelaConfiguracao.update(this));
    print("ATUALIZADO");
    if (listMapConfig.length > 0) {
      Configuracao config = Configuracao.fromMapSqLite(listMapConfig.first);
      return config;
    }
    return null;
  }

  static Future<List<Configuracao>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(TabelaConfiguracao.getAll());
    List<Configuracao> configs = List();
    for (Map m in listMap) {
      configs.add(Configuracao.fromMapSqLite(m));
    }
    return configs;
  }

  static Future<Configuracao> getId(int id) async {
    Database dataBase = await SqlHelper().db;
    List listMapConfig =
        await dataBase.rawQuery(TabelaConfiguracao.getPorId(id));
    print(listMapConfig);
    if (listMapConfig.length > 0) {
      Configuracao config = Configuracao.fromMapSqLite(listMapConfig.first);
      return config;
    }
    return null;
  }

  static Future removeId(int id) async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaConfiguracao.removeId(id));
  }

  static Future removeAll() async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaConfiguracao.removeAll());
  }
}
