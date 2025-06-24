import 'package:flutter/material.dart';
import 'package:sql_lite_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sqflite Demo',
      home: Home(),
    );
  }
}