class FaseUtil {
  static int pontuacao = 0;
  static int faseJogar = 1;
  static int get faseAtual => _getFase();

  static int _atual = 1;
  static int _faseMaxima = 4;

  static bool get faseFinal => fim();

  static double velocidade = 9;
  static double volume = 1.0;

  static _getFase() {
    return _atual;
  }

  static setFaseAtual(int valor) {
    if (_atual >= _faseMaxima)
      _atual = _faseMaxima;
    else
      _atual += valor;
  }

  static bool fim() {
    if (faseJogar >= _faseMaxima && _atual >= _faseMaxima)
      return true;
    else
      return false;
  }
}
