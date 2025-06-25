import 'package:flutter/material.dart';
import 'package:sql_lite_app/add_screen/presentation/views/widgets/build_textfiled.dart';
import 'package:sql_lite_app/add_screen/presentation/views/widgets/save_button.dart';
import 'package:sql_lite_app/sqldb.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  Sqldb sqldb = Sqldb();
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    color.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              buildTextField(
                controller: title,
                hint: "Enter title",
                icon: Icons.title,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: note,
                
                hint: "Enter note",
                icon: Icons.note,
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: color,
                hint: "Enter color code",
                icon: Icons.color_lens,
              ),
              const SizedBox(height: 24),
              Save_Button(sqldb: sqldb, title: title, note: note, color: color)
            ],
          ),
        ),
      ),
    );
  }

  
}

