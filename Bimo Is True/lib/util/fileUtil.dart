
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtil {

  static Future<String> get getFilePath async{
    final diretorio = await getApplicationDocumentsDirectory();
    return diretorio.path;
  }

  static Future<File> getFile(String arquivo) async{
    final path = await getFilePath;
    print("$path/"+arquivo);
    return File("$path/"+arquivo);
  }

  static Future<File> saveFile(String data, String arquivo) async{
    final file = await getFile(arquivo);
    return file.writeAsString(data);
  }

  static Future<String> readFile(String arquivo) async{
    try{
      print(arquivo);
      final file = await getFile(arquivo);
      String data = await file.readAsString();
      return data;
    }catch(e){
      print(e);
      return "Data error";
    }
  }

  static Future<String> carregarArquivo(String caminho) async {
    String data = await rootBundle.loadString("assets/"+caminho);
    return data;
  }

}