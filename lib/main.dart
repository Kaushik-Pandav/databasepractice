import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UserDatabaseController.dart';
import 'login.dart';

void main(){
  Get.put(UserDatabaseController());
  runApp(MaterialApp(home: LoginPage(),));
}

