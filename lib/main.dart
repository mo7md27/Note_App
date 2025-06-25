import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_lite_app/add_screen/presentation/views/add_notes.dart';
import 'package:sql_lite_app/home.dart';
import 'package:sql_lite_app/home_screen/data/models/cubit/notes_cubit.dart';
import 'package:sql_lite_app/sqldb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(Sqldb())..loadNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'sqflite Demo',
        home: const Home(),
        routes: {
          "addnotes": (context) => const AddNotes(),
        },
      ),
    );
  }
}
