import 'package:crewindemoproject/Router/router.dart';
import 'package:crewindemoproject/body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routerr.generateRoute,
      debugShowCheckedModeBanner: false,
      color: Colors.black26,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Crewin Demo App"),
        ),
        body: const Body(),
      ),
    );
  }
}
