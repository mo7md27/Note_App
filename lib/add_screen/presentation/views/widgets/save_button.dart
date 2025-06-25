import 'package:flutter/material.dart';
import 'package:sql_lite_app/home_screen/presentation/views/home.dart';
import 'package:sql_lite_app/sqldb.dart';

class Save_Button extends StatelessWidget {
  const Save_Button({
    super.key,
    required this.sqldb,
    required this.title,
    required this.note,
    required this.color,
  });

  final Sqldb sqldb;
  final TextEditingController title;
  final TextEditingController note;
  final TextEditingController color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async{
     int response= await sqldb.insertData(
        "INSERT INTO notes (title, note, color) VALUES ('${title.text}', '${note.text}', '${color.text}')"
      );
    
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
      child: const Text("Save Note"),
    );
  }
}
