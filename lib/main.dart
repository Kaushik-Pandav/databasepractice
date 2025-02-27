import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UserDatabaseController.dart';
import 'login.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});
  @override
  State<SpashScreen> createState() => _SpashScreenState();
}
class _SpashScreenState extends State<SpashScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

void main(){
  Get.put(UserDatabaseController());
  runApp(MaterialApp(home: GetMaterialApp(
    home: SpashScreen()
  )));
}

