import 'package:flutter/material.dart';
import 'package:sql_lite_app/sqldb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sqldb sqldb = Sqldb();

 Future<List<Map>>readdata()async{
  List<Map> response = await sqldb.readData('SELECT * FROM notes');
  return response;

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{},
      child: Icon(Icons.add)
      ),
      body: Container(
        child: ListView(
          children: [

            // MaterialButton(onPressed: ()async{
            //  await  sqldb.mydeleteDatabase();

            // },
            // child: Text("Delete DataBase"),),
            FutureBuilder( 
              future: readdata(),
              builder: (BuildContext context , AsyncSnapshot<List<Map>> snapshot) {
              if(snapshot.hasData){
                
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,i){
                    return Card(child: ListTile(
                      title:Text(snapshot.data![i]['note'].toString(),
                    )));
                  

                });
              }
              return Center(
                child: CircularProgressIndicator(),
              );

              

            })

          ],
        ),
      ),
    );
  }
}
