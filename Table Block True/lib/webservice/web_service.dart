import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tableblocktrue/beans/usuario.dart';

class WebService {
  static final String URL = "http://192.168.1.107:8000";

  static Future<Usuario> getUsuarioLoginSenha(Usuario usuario) async {
    http.Response responser = await http
        .post(URL+"/table/login/",
     body: {"login": usuario.login, "senha" : usuario.senha},
     headers: {'Accept' : 'application/json'});

    print(responser);
    String body = responser.body;
    Map valueMap = json.decode(body);
    print(valueMap['retorno']);
    if (valueMap['retorno'] == false) {
      return null;
    } else {
      return Usuario.fromMapWeb(valueMap['usuario']);
    }
  }

  static Future<Usuario> cadastroUsuario(Usuario usuario) async {
    http.Response responser = await http
    .post(URL+"/table/cadastro/",
     body: {"nome": usuario.nome, "login": usuario.login, "senha" : usuario.senha},
     headers: {'Accept' : 'application/json'});

    String body = responser.body;
    Map valueMap = json.decode(body);
    print(valueMap['retorno']);
    if (valueMap['retorno'] == false) {
      return null;
    } else {
      return Usuario.fromMapWeb(valueMap['usuario']);
    }
  }
}
