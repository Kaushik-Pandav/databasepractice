import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  Future<Database> createDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'userdata.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT,number TEXT,password TEXT)",
        );
      },
    );
    return database;
  }

  void insert(
      Database db, {
        required String name,
        required String email,
        required String password,
        required String number
      }) {
    String sql =
        "INSERT INTO users ('name','email','password','number') VALUES('$name','$email','$password','$number')";
    db.rawInsert(sql);
  }

  Future<List> checkdata(
    Database db, {
    required String username,
    required String password,
  }) async {
    String sql="SELECT id,name,email,number,password FROM user WHERE email='$username' OR number='$username' AND password='$password'";
    List data=await db.rawQuery(sql);
    return data;
  }
}
