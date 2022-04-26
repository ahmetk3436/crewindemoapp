import 'package:crewindemoproject/Router/router.dart';
import 'package:crewindemoproject/mainBody/body.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          backgroundColor: Colors.white,
          title: const Text(
            "Crewin Demo App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
