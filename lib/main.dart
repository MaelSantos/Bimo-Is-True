//imports do flutter
import 'package:flutter/material.dart';

//meus imports
import 'view/menu.dart';

void main() async {
  runApp(MyApp()); //rodo a aplicação
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // O widget Scaffold define o layouta da home
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Times", //define a fonte familia do texto
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white), //define a cor padrão dos textos
          )
        ),
        
        home: Menu());
  }
}
