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

    UserDatabase().readData(controller.database!).then((value) {
      alldata=value;
    });
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
        itemCount: alldata!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${alldata![index]}"),//showing instance of usermodel
          );
        },
      ),
    );
  }
}
