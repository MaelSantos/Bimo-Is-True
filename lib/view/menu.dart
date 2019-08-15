
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'principal.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {

  int index;
  String titulo;

  Principal principal;

  @override
  void initState() {
    index = 0;
    titulo = "LogMan";
    principal = Principal();
    super.initState();
  }

  // O método build reconstrói a árvore de widegts se houver mudanças
  // e permite o hot reload
  @override
  Widget build(BuildContext context) {

    // Agora ao ínves de um Container estamos usando o widget MaterialApp
    // o qual é configurado para dar à nossa app um tema Material
    return Scaffold(
      // Vamos passar um widget AppBar widget para a propriedade appBar do Scaffold
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          // A prop. AppBar usa um widget Text widget para a sua prop. title
          title: Text(titulo),
          backgroundColor: Colors.lightBlue,
        ),
//        drawer: Drawer(
//          child: ListView(
//              padding: EdgeInsets.zero,
//              children: <Widget>[
//                DrawerHeader( //menu hamburguer
//                  child: Text('Log Man', style: TextStyle(fontSize: 20, color: Colors.white),),
//                  decoration: BoxDecoration(
//                    color: Colors.lightBlue,
//                  ),
//                ),
//                ListTile( //lista de opções
//                    title: Text("Principal"),
//                    onTap: () {
//                      setState(() {
//                        titulo = "Bandeiras LGBT";
//                        index = 0;
//                      });
//                      Navigator.pop(context);
//                    }
//                ),
//                ListTile(
//                    title: Text("Sobre"),
//                    onTap: () {
//                      setState(() {
//                        titulo = "Sobre";
//                        index = 1;
//                      });
//                      Navigator.pop(context);
//                    }
//                ),
//                ListTile(
//                    title: Text("Sair"),
//                    onTap: () {
//                      setState(() {
//                        index = 2;
//                      });
//                      Navigator.pop(context);
//                    }
//                ),
//              ]),
//        ),

        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: mudarTela(),
          ),
        )
    );
  }

  Widget mudarTela() {
    switch (principal.tela) {
      case 0:
        return principal;
      case 1:
        return Container();
      case 2:
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return null;
    }
    return null;
  }

}
