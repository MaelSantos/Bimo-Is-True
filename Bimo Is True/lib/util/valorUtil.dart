import 'dart:math';

import 'package:tableblocktrue/util/faseUtil.dart';
import 'package:tableblocktrue/util/tipos_preposicao.dart';

String boolInString(bool valor) {
  if (valor) return "V";
  return "F";
}

int stringInPosition(String valor) {
  if (valor.length < 2) return 12;
  if (valor.length >= 2 && valor.length < 3) return 9;
  if (valor.length >= 3) return 6;

  return 0;
}

String tipoInString(TipoPreposicao tipo) {
  if (tipo == TipoPreposicao.e) {
    return "&";
  } else if (tipo == TipoPreposicao.ou) {
    return "v";
  } else if (tipo == TipoPreposicao.nao) {
    return "~";
  } else if (tipo == TipoPreposicao.se_entao) {
    return "->";
  } else if (tipo == TipoPreposicao.se_somente_se) {
    return "<->";
  } else
    return "Erro";
}

TipoPreposicao intInTipo(int valor) {
  return TipoPreposicao.values[valor];
}

List<bool> gerarValores() {
  List<bool> valores = List();

  int aux = 0;
  if (FaseUtil.faseJogar == 0)  aux += FaseUtil.dificuldadeTreino;

  for (int i = 0; i <= FaseUtil.faseJogar + aux; i++)
    valores.add(Random().nextBool());
  return valores;
}

String gerarProposicao(List<bool> valores) {
  String proposicao = "";

  for (int i = 0; i < valores.length; i++) {
    bool b = valores[i];
    if (i == valores.length - 1) {
      if (valores.length % 2 == 0 && valores.length != 2)
        proposicao += "${boolInString(b)}) = ";
      else
        proposicao += "${boolInString(b)} = ";
    } else if (i % 2 != 0)
      proposicao += "${boolInString(b)}) ? ";
    else if (valores.length != 2)
      proposicao += "(${boolInString(b)} ? ";
    else
      proposicao += "${boolInString(b)} ? ";
  }
  return proposicao;
}

bool calcularProposicao(TipoPreposicao tipo, List<bool> valores) {
  bool valor = false;

  if (tipo == TipoPreposicao.e) {
    valor = and(valores);
    _atualizarValores(valores, valor);
  } else if (tipo == TipoPreposicao.ou) {
    valor = or(valores);
    _atualizarValores(valores, valor);
  } else if (tipo == TipoPreposicao.nao) {
    valor = not(valores);
  } else if (tipo == TipoPreposicao.se_entao) {
    valor = se(valores);
    _atualizarValores(valores, valor);
  } else if (tipo == TipoPreposicao.se_somente_se) {
    valor = somente(valores);
    _atualizarValores(valores, valor);
  }

  return valor;
}

bool and(List<bool> valores) {
  bool valor = false;
  if (valores[0] && valores[1]) valor = true;
  return valor;
}

bool or(List<bool> valores) {
  bool valor = false;
  if (valores[0] || valores[1]) valor = true;
  return valor;
}

bool not(List<bool> valores) {
  valores[0] = !valores[0];
  return !valores[0];
}

bool se(List<bool> valores) {
  bool valor = true;
  if (valores[0] == true && valores[1] == false) {
    valor = false;
  }
  return valor;
}

bool somente(List<bool> valores) {
  bool valor = false;
  if (valores[0] == true && valores[1] == true) {
    valor = true;
  } else if (valores[0] == false && valores[1] == false) {
    valor = true;
  }
  return valor;
}

void _atualizarValores(List<bool> valores, bool valor) {
  valores.removeAt(0);
  valores.removeAt(0);

  if (valores.length >= 4)
    valores.add(valor);
  else
    valores.insert(0, valor);
}
