import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_signup/database.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseController extends GetxController {
  Database? database;
  UserDatabase userDatabase = UserDatabase();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();



  void insertdata(
  ) {
    String name = namecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroler.text.trim();
    String number=numbercontroller.text.trim();
    userDatabase.insert(
      database!,
      name: name,
      email: email,
      number: number,
      password: password,
    );
  }
  void login()
  {
    String username=emailcontroller.text.trim();
    String password=passwordcontroler.text.trim();
    userDatabase.checkdata(database!, username: username, password: password);
  }
}
