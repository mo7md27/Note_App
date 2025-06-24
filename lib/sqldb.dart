import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {

  static Database? _db;

 Future<Database?> get db async{
    if(_db == null){
       _db ??= await intialDb();
       return _db;
    }else{
      return _db;
      
      }// If the database is not initialized, call intialDb to create it
  }


intialDb()async{
  String databasepath= await getDatabasesPath();// Get the default database path
  String path = join(databasepath , 'mydatabase.db');// Join the path with the database name

  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );// Create the database if it doesn't exist

  return database;// Return the database instance
}

_onCreate (Database db, int version) async {
  await db.execute('''
    CREATE TABLE "notes"(
      id INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY ,
      notes TEXT NOT NULL
    )
  ''');
  print("Crete data base=================");// Create the "notes" table with the specified columns

}



// SELECT
readData(String sql)async{
  Database? database =await db;
  List<Map> response =await database!.rawQuery(sql);
  return response;// Execute the SQL query and return the result

}
 // INSERT
insertData(String sql)async{
  Database? database =await db;
  int response =await database!.rawInsert(sql);
  return response;// Execute the SQL query and return the result

}

// UPDATE
updateData(String sql)async{
  Database? database =await db;
  int response =await database!.rawUpdate(sql);
  return response;// Execute the SQL query and return the result

}
// DELETE
deleteData(String sql)async{
  Database? database =await db;
  int response =await database!.rawDelete(sql);
  return response;// Execute the SQL query and return the result

}
}