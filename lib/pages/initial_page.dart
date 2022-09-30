import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            child: Text('Winfood'),
            onTap: (){
              Navigator.popAndPushNamed(context, '/cardapio');
            },
          )
        ],
      ),
    );
  }

}
