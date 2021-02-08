import 'package:flutter/material.dart';
import 'package:flutter_pj/add_Image.dart';
import 'package:firebase_core/firebase_core.dart';

import 'commu1.dart';
import 'add_Image.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}
  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CommuP());
  }
}

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddImage());
  }
}


