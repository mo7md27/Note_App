import 'package:flutter/material.dart';
import 'package:sql_lite_app/home_screen/presentation/views/widgets/floting_add_button.dart';
import 'package:sql_lite_app/home_screen/presentation/views/widgets/notes_list.dart';
import 'package:sql_lite_app/sqldb.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sqldb sqldb = Sqldb();
  bool isLoading = true;
  List notes = [];

  Future readdata() async {
    List<Map> response = await sqldb.read('notes');
    notes.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: const FloatingAddButton(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: NotesList(
          notes: notes,
          onDelete: (id) async {
            int response = await sqldb.deleteData('DELETE FROM notes WHERE id = $id');
            if (response > 0) {
              notes.removeWhere((element) => element['id'] == id);
              setState(() {});
            }
          },
        ),
      ),
    );
  }
}
