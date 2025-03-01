import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/UserDatabaseController.dart';
import 'package:login_signup/database.dart';

class Showdatapage extends StatefulWidget {
  const Showdatapage({super.key});

  @override
  State<Showdatapage> createState() => _ShowdatapageState();
}

class _ShowdatapageState extends State<Showdatapage> {
  UserDatabaseController controller = Get.find<UserDatabaseController>();
  List? alldata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    controller.showdata().then((value) {

    },);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ShowData",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('{}'),//showing instance of usermodel
          );
        },
      ),
    );
  }
}
