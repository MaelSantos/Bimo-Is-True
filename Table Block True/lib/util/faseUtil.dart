class FaseUtil {
  static int faseJogar = 1;
  static get faseAtual => _getFase();

  static int _atual = 0;
  static int _faseMaxima = 2;

  static double velocidade = 9;

  static _getFase() {
    return _atual;
  }

  static setFaseAtual(int valor) {
    if (_atual >= _faseMaxima)
      _atual = _faseMaxima;
    else
      _atual += valor;
  }

}
