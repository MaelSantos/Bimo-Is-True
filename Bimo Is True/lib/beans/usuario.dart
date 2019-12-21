import 'package:bimo_is_true/util/Sqlite/tabela_usuario.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:bimo_is_true/util/Sqlite/SqLite.dart';

class Usuario {
  int id;
  String nome;
  String login;
  String senha;
  bool ativo = false;

  Usuario();

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, login: $login, senha: $senha, ativo: $ativo}';
  }

  Usuario.fromMapWeb(Map map) {
    id = map["id"];
    nome = map["nome"];
    login = map["login"];
    senha = map["senha"];
  }

  Usuario.fromMapSqLite(Map map) {
    id = map[TabelaUsuario.COL_ID];
    nome = map[TabelaUsuario.COL_NOME];
    login = map[TabelaUsuario.COL_LOGIN];
    senha = map[TabelaUsuario.COL_SENHA];
    ativo = map[TabelaUsuario.COL_ATIVO] == 1 ? ativo = true : ativo = false;
  }

  Map toMap() {
    Map<String, dynamic> map = {
      TabelaUsuario.COL_ID: id,
      TabelaUsuario.COL_NOME: nome,
      TabelaUsuario.COL_LOGIN: login,
      TabelaUsuario.COL_SENHA: senha,
      TabelaUsuario.COL_ATIVO: ativo,
    };
    return map;
  }

  Future<int> save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaUsuario.NOME_TABELA, toMap());
    print("VALOR $valor");
    return valor;
  }

  Future<Usuario> update() async {
    Database dataBase = await SqlHelper().db;
    List listMapUsuario =
        await dataBase.rawQuery(TabelaUsuario.update(ativo, id));
    if (listMapUsuario.length > 0) {
      Usuario usuario = Usuario.fromMapSqLite(listMapUsuario.first);
      return usuario;
    }
    return null;
  }

  static Future<List<Usuario>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(TabelaUsuario.getAll());
    List<Usuario> usuarios = List();
    for (Map m in listMap) {
      usuarios.add(Usuario.fromMapSqLite(m));
    }
    return usuarios;
  }

  static Future<Usuario> getAtivo() async {
    Database dataBase = await SqlHelper().db;
    List listMapUsuario =
        await dataBase.rawQuery(TabelaUsuario.getAllPorAtivo(true));
    if (listMapUsuario.length > 0) {
      Usuario usuario = Usuario.fromMapSqLite(listMapUsuario.first);
      return usuario;
    }
    return null;
  }

  static Future<Usuario> getLogin(String login, String senha) async {
    Database dataBase = await SqlHelper().db;
    List listMapUsuario =
        await dataBase.rawQuery(TabelaUsuario.getPorLoginSenha(login, senha));
        // await dataBase.rawQuery(TabelaUsuario.getPorId(3));
        print(listMapUsuario);
    if (listMapUsuario.length > 0) {
      Usuario usuario = Usuario.fromMapSqLite(listMapUsuario.first);
      return usuario;
    }
    return null;
  }

  static Future removeId(int id) async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaUsuario.removeId(id));
  }

  static Future removeAll() async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaUsuario.removeAll());
  }
}
