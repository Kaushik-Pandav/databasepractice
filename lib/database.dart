import 'package:login_signup/UserModal.dart';
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
    required String number,
  }) {
    String sql =
        "INSERT INTO user ('name','email','password','number') VALUES('$name','$email','$password','$number')";
    db.rawInsert(sql);
  }

  Future<List> checkdata(
    Database db, {
    required String username,
    required String password,
  }) async {
    String sql =
        "SELECT id,name,number,password FROM user WHERE (email='$username' OR number='$username') AND password='$password'";
    List data = await db.rawQuery(sql);
    return data;
  }

  Future<List<UserModal>> readData(Database db) async {
    String sql = "SELECT * FROM user";
    List<Map> alldata = await db.rawQuery(sql);
    List<UserModal> list = [];
    for (int i = 0; i < alldata.length; i++) {
      UserModal userModal = UserModal(
        alldata[i]['id'],
        alldata[i]['name'],
        alldata[i]['number'],
        alldata[i]['email'],
        alldata[i]['password'],
      );
      list.add(userModal);
    }
    return list;
  }
}
