import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/UserDatabaseController.dart';

import 'SignUpPage.dart';
import 'database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  UserDatabaseController controller=Get.find<UserDatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'LoginPage',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
              controller: controller.emailcontroller,
              decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.all(Radius.circular(3)))),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              )),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
              controller: controller.passwordcontroler,
              decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      gapPadding: 5)),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
              )),
        ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                String user = controller.emailcontroller.text;
                String pass = controller.passwordcontroler.text;
              },
              child: Center(child: Text('Login',style: TextStyle(
                color: Colors.white,fontSize: 20
              ),)),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SighUp();
                  },
                ),
              );
            },
            child: Text('New User? Sighup Here'),
          ),
        ],
      ),
    );
  }
}
