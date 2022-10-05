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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Colors.grey,width: 3)
              ),
              child: Icon(Icons.store_mall_directory_rounded,color: Colors.green,size: 60,),
            ),
            Container(
                child: const Text(
                    'Loja não encontrada',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    )
                )
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: const Text(
                    '404 not found',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

}
