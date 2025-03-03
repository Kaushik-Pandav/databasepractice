import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/UserDatabaseController.dart';
import 'package:login_signup/UserModal.dart';
import 'package:login_signup/database.dart';

class Showdatapage extends StatefulWidget {
  const Showdatapage({super.key});

  @override
  State<Showdatapage> createState() => _ShowdatapageState();
}

class _ShowdatapageState extends State<Showdatapage> {
  UserDatabaseController controller = Get.find<UserDatabaseController>();
  List<UserModal> showdata=[];
  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ShowData",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
      body: ListView.builder(
        itemCount: showdata.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(showdata[index].name),
          );
        },
      ),
    );
  }
  Future<void> getdata() async {
    showdata=await controller.showData();
  }
}
