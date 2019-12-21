import 'package:bimo_is_true/beans/configuracao.dart';

class TabelaConfiguracao {
  static const String NOME_TABELA = "Configuracao";
  static const String COL_ID = "id";
  static const String COL_INTRODUCAO = "introducao";
  static const String COL_IN_VOLUME = "inVolume";
  static const String COL_VELOCIDADE = "velocidade";
  static const String COL_VOLUME = "volume";
  static const String COL_VOLUME_ANTERIOR = "volumeAnterior";
  static const String COL_DIFICULDADE_TREINO = "dificuldadeTreino";
  static const String COL_FASE_ATUAL = "faseAtual";
  
  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_INTRODUCAO BOOL, "
      "$COL_IN_VOLUME  BOOL, "
      "$COL_VELOCIDADE REAL, "
      "$COL_VOLUME REAL, "
      "$COL_VOLUME_ANTERIOR REAL, "
      "$COL_DIFICULDADE_TREINO INTEGER, "
      "$COL_FASE_ATUAL INTEGER "
      ");";

  static String getPorId(int id) {
    return "SELECT * FROM $NOME_TABELA where $COL_ID='$id'";
  }

  static String update(Configuracao c) {
    int intro;
    c.introducao ? intro = 1 : intro = 0;

    int inVol;
    c.inVolume ? inVol = 1 : inVol = 0;
    
    return "UPDATE $NOME_TABELA "
    "SET $COL_INTRODUCAO=$intro, " 
    "$COL_IN_VOLUME=$inVol, "
    "$COL_VELOCIDADE=${c.velocidade}, "
    "$COL_VOLUME=${c.volume}, "
    "$COL_VOLUME_ANTERIOR=${c.volumeAnterior}, "
    "$COL_DIFICULDADE_TREINO=${c.dificuldadeTreino}, "
    "$COL_FASE_ATUAL=${c.faseAtual} "
    "where id=${c.id}";

  }

  static String getAll() {
    return "SELECT * FROM $NOME_TABELA";
  }

  static String removeId(int id) {
    return "DELETE FROM $NOME_TABELA where id='$id'";
  }

  static String removeAll() {
    return "DELETE FROM $NOME_TABELA ";
  }
}
