import 'package:flutter/material.dart';
import 'package:sql_lite_app/add_screen/presentation/views/widgets/build_textfiled.dart';
import 'package:sql_lite_app/edit_screen/presentation/views/widgets/update_button.dart';
import 'package:sql_lite_app/sqldb.dart';

class EditNodes extends StatefulWidget {

  final note;
  final title;
  final color;
  final id;

  const EditNodes({super.key, this.note, this.title, this.id, this.color});

  @override
  State<EditNodes> createState() => _EditNodesState();
}

class _EditNodesState extends State<EditNodes> {

  Sqldb sqldb = Sqldb();
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();


@override
  void initState() {

note.text=widget.note;
title.text=widget.title;
color.text=widget.color;

    super.initState();
  }
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
        title: const Text("Edit Notes"),
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
                hint: "Enter color ",
                icon: Icons.color_lens,
              ),
              const SizedBox(height: 24),
              Update_Button(sqldb: sqldb, title: title, note: note, color: color, widget: widget)
            ],
          ),
        ),
      ),
    );
  }

  
}

