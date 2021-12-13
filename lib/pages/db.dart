import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
    Database? db;
  MyDb() {
    open();
  }
  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Todo.db');
    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''

                  CREATE TABLE IF NOT EXISTS Todos( 
                        id primary key,
                        name varchar(255) not null,
                        roll_no int not null,
                        address varchar(255) not null
                    );

                 
                
                ''');
      //table Todos will be created if there is no table 'Todos'
      print("Table Created");
    });
  }

  Future<Map<dynamic, dynamic>?> getTodo(int rollno) async {
    List<Map> maps =
        await db!.query('Todos', where: 'roll_no = ?', whereArgs: [rollno]);
    //getting Todo data with todo no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}
