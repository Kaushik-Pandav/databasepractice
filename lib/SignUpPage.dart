import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/UserDatabaseController.dart';

class SighUp extends StatefulWidget {
  const SighUp({super.key});

  @override
  State<SighUp> createState() => _SighUpState();
}

class _SighUpState extends State<SighUp> {
  UserDatabaseController controller = Get.find<UserDatabaseController>();

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.userDatabase.createDatabase().then(
      (value) => controller.database,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'SignUp',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Fields(controller.namecontroller, 'Name'),
          Fields(controller.emailcontroller, 'Email'),
          Fields(controller.numbercontroller, 'Mobile No'),
          Fields(controller.passwordcontroler, 'Password'),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(3),
            ),
            child: InkWell(
              onTap: () {
                controller.insertdata();
              },
              child: Center(
                child: Text(
                  'SignUp',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Fields(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: '$hint',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            gapPadding: 5,
          ),
        ),
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
      ),
    );
  }
}
