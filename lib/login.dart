import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/UserDatabaseController.dart';

import 'SignUpPage.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  UserDatabaseController controller=Get.find<UserDatabaseController>();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

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
              controller: username,
              decoration: const InputDecoration(
                  labelText: "username",
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
              controller: password,
              decoration: const InputDecoration(
                  labelText: "password",
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
              onTap: () async {
                String user = username.text.trim();
                String pass = password.text.trim();
                controller.login(username: user, password: pass);
                await SpashScreen.sp!.setString('Username', user);
                await SpashScreen.sp!.setString('password', pass);
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
