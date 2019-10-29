import 'dart:math';

import 'package:tableblocktrue/util/tipos_preposicao.dart';

String boolInString(bool valor) {
  if (valor) return "V";
  return "F";
}

String tipoInString(TipoPreposicao tipo) {
  if (tipo == TipoPreposicao.e) {
    return "^";
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

TipoPreposicao gerarTipoPreposicao() {
  Random r = Random();
  int valor = r.nextInt(5);
  return intInTipo(valor);
}

bool calcularProposicao(TipoPreposicao tipo, List<bool> valores) {
  bool valor = false;

  if (tipo == TipoPreposicao.e) {
    valor = and(valores);
  } else if (tipo == TipoPreposicao.ou) {
    valor = or(valores);
  } else if (tipo == TipoPreposicao.nao) {
    valor = not(valores);
  } else if (tipo == TipoPreposicao.se_entao) {
    valor = se(valores);
  } else if (tipo == TipoPreposicao.se_somente_se) {
    valor = somente(valores);
  }

  return valor;
}

bool and(List<bool> valores) {
  
  bool valor = true;
  valores.forEach((f) {
    if (!f) {
      //se existir pelo menos um valor falso então a preposição será falsa
      valor = false;
    }
  });
  return valor;
}

bool or(List<bool> valores) {
  bool valor = false;
  valores.forEach((f) {
    if (f) {
      //se existir pelo menos um valor verdadeiro então a preposição será verdadeira
      valor = true;
    }
  });
  return valor;
}

bool not(List<bool> valores) {
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
  bool valor = true;
  //será verdeiro se todos forem verdadeiros ou todos forem falsos
  valores.forEach((f) {
    valor = true;
    if (!f) {
      //todos tem que ser verdadeiros (true)
      valor = false;
    }
  });
  if (!valor) {
    //so verifica se todos são falsos se a verificação anterior falhar
    valores.forEach((f) {
      valor = true;
      if (f) {
        //todos tem que ser falsos (true)
        valor = false;
      }
    });
  }
  return valor;
}
