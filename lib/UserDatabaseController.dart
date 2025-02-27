import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/database.dart';
import 'package:login_signup/showDatapage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseController extends GetxController {
  Database? database;
  UserDatabase userDatabase = UserDatabase();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userDatabase.createDatabase().then((value) => database = value);
  }

  void insertdata() {
    String name = namecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroler.text.trim();
    String number = numbercontroller.text.trim();
    userDatabase.insert(
      database!,
      name: name,
      email: email,
      number: number,
      password: password,
    );
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List data = await userDatabase.checkdata(
      database!,
      username: username,
      password: password,
    );
    if (data != null) {
      await preferences.setString('username', '$username');
      await preferences.setString('password', '$password');
      Get.to(Showdatapage());
    }
  }
  Future<List> showdata()
  async {
    List alldata=await userDatabase.readData(database!);
    return alldata;
  }
}
