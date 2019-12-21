import 'package:bimo_is_true/beans/configuracao.dart';

import '../beans/usuario.dart';

class ConfigUtil {
  // static Usuario userLogado;

  static final ConfigUtil _instance = ConfigUtil.internal();
  factory ConfigUtil(){
    _instance._initConfiguracao();
    return _instance;
  }
  ConfigUtil.internal();

  Configuracao _configuracao;
  Configuracao get configuracao => _configuracao;
  // Future<Configuracao> get configuracao => _initConfiguracao();

  void _initConfiguracao() async {
    if (_configuracao == null) {
      _configuracao = await Configuracao.getId(1);
      if (_configuracao == null) {
        _configuracao = Configuracao();
        _configuracao.introducao = true;
        _configuracao.save();
      }
    }
  }

  // Future<Configuracao> _initConfiguracao() async {
  //   if (_configuracao == null) {
  //     _configuracao = await Configuracao.getId(1);
  //     if (_configuracao == null) {
  //       _configuracao = Configuracao();
  //       _configuracao.introducao = true;
  //       _configuracao.save();
  //     }
  //   }
  //   return _configuracao;
  // }

}
