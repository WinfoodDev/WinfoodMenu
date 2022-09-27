import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:winfood_menu/pages/home_page.dart';



void main() {
  setUrlStrategy(PathUrlStrategy());
  print(Uri.base.toString());
  print(Uri.base.query);
  String query = Uri.base.query;
  runApp(MyApp(codloja: query,));
}

class MyApp extends StatelessWidget {
  String?codloja;
  MyApp({Key? key,this.codloja}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardapio',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/':(_)=>HomePage(codloja: codloja,)
      },
    );
  }
}

