import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserDatabaseController.dart';
import 'login.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  static SharedPreferences? sp;

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsharedpref();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }

  Future<void> getsharedpref() async {
    SpashScreen.sp = await SharedPreferences.getInstance();
    await SpashScreen.sp!.setBool('LoginStatus', true);
  }
}

void main() {
  Get.put(UserDatabaseController());
  runApp(MaterialApp(home: GetMaterialApp(home: SpashScreen())));
}
