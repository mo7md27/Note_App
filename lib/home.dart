import 'package:flutter/material.dart';
import 'package:sql_lite_app/edit_screen/presentation/views/edit_nodes.dart';
import 'package:sql_lite_app/home_screen/presentation/views/widgets/floting_add_button.dart';
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
    if(mounted){
      setState(() {
         
      });
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
      floatingActionButton: FloatingAddButton(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:  ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(notes[i]['title']?.toString() ?? 'No Title',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(notes[i]['note']?.toString() ?? 'No Note'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: ()async{
                          int response = await sqldb.deleteData('DELETE FROM notes WHERE id = ${notes[i]['id']}');
                          if(response>0){
                            notes.removeWhere((element)=>element['id'] == notes[i]['id']);
                            setState(() {
                              
                            });
                          }
                        
                        },
                        icon: Icon(Icons.delete_outline),color: Colors.redAccent,),
                        SizedBox(width: 10,),
                        IconButton(onPressed: ()async{
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditNodes(
                            id: notes[i]['id'],
                            title: notes[i]['title'],
                            note: notes[i]['note'],
                            color: notes[i]['color'],
                          ),
                        )
                       );
                        },
                        icon: Icon(Icons.update_outlined),color: Colors.blueAccent,),
                      ],
                    ),
                  ),
                );
              },
            )
          
      ),
    );
  }
}

