import 'package:flutter/material.dart';
import 'package:sql_lite_app/edit_screen/presentation/views/edit_nodes.dart';
import 'package:sql_lite_app/home.dart';
import 'package:sql_lite_app/sqldb.dart';

class Update_Button extends StatelessWidget {
  const Update_Button({
    super.key,
    required this.sqldb,
    required this.title,
    required this.note,
    required this.color,
    required this.widget,
  });

  final Sqldb sqldb;
  final TextEditingController title;
  final TextEditingController note;
  final TextEditingController color;
  final EditNodes widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async{
     int response= await sqldb.insertData(
      'UPDATE notes SET title = "${title.text}", note = "${note.text}", color = "${color.text}" WHERE id = ${widget.id}');
    
      if(response>0){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context)=>Home()), 
            (route)=>false);
      }
      print("response=========================");
        
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text("Save Edit"),
    );
  }
}
