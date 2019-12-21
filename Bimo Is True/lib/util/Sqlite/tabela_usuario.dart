class TabelaUsuario {
  static const String NOME_TABELA = "usuario";
  static const String COL_ID = "id";
  static const String COL_NOME = "nome";
  static const String COL_LOGIN = "login";
  static const String COL_SENHA = "senha";
  static const String COL_ATIVO = "ativo";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_NOME TEXT, "
      "$COL_LOGIN TEXT, "
      "$COL_SENHA TEXT, "
      "$COL_ATIVO BOOL);";

  static String getAllPorAtivo(bool ativo) {
    int valor;
    ativo? valor = 1 : valor = 0;
    return "SELECT * FROM $NOME_TABELA where $COL_ATIVO='$valor'";
  }

  static String getPorId(int id) {
    return "SELECT * FROM $NOME_TABELA where id='$id'";
  }

  static String getPorLoginSenha(String login, String senha) {
    return "SELECT * FROM $NOME_TABELA where login='$login' and senha='$senha'";
  }

  static String update(bool ativo, int id) {
    int valor;
    ativo? valor = 1 : valor = 0;
    return "UPDATE $NOME_TABELA SET ativo=$valor where id=$id";
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
