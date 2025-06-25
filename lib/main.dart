import 'package:flutter/material.dart';
import 'package:sql_lite_app/add_screen/presentation/views/add_notes.dart';
import 'package:sql_lite_app/home_screen/presentation/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sqflite Demo',
      home: Home(),
      routes: {
        "addnotes":(context)=>AddNotes(),
      },
    );
  }
}