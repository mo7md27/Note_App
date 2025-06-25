import 'package:flutter/material.dart';
import 'package:sql_lite_app/home_screen/presentation/views/home.dart';
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
              _buildTextField(
                controller: title,
                hint: "Enter title",
                icon: Icons.title,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: note,
                
                hint: "Enter note",
                icon: Icons.note,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: color,
                hint: "Enter color code",
                icon: Icons.color_lens,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
   
    required String hint,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      validator: (val) {
       
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}
