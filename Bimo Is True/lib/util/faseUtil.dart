import 'package:bimo_is_true/util/configUtil.dart';

class FaseUtil {
  static ConfigUtil _configUtil = ConfigUtil();

  static int pontuacao = 0;
  static int faseJogar = 1;
  static int _faseMaxima = 4;

  static int get dificuldadeTreino =>
      _configUtil.configuracao.dificuldadeTreino;
  static int get faseAtual => _configUtil.configuracao.faseAtual;
  static bool get faseFinal => fim();

  static setFaseAtual(int valor) {
    print("$faseJogar == ${_configUtil.configuracao.faseAtual}");
    if (_configUtil.configuracao.faseAtual >= _faseMaxima)
      _configUtil.configuracao.faseAtual = _faseMaxima;
    else if (faseJogar > _configUtil.configuracao.faseAtual)
      _configUtil.configuracao.faseAtual += valor;
    _configUtil.configuracao.update();
  }

  static bool fim() {
    if (faseJogar >= _faseMaxima &&
        _configUtil.configuracao.faseAtual >= _faseMaxima)
      return true;
    else
      return false;
  }
}
