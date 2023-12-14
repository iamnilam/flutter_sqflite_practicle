// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_sqflite_practicle/login_sharedprefs/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  static const String LOGIN_PREF_KEY = "isLogin";
  static const String USERNAME_PREF_KEY = "uName";
  static const String APP_OPEN_PRE_KEY = "app_open";
  TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: loginController,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(LOGIN_PREF_KEY, true);

                var mName = loginController.text.toString();
                prefs.setString(USERNAME_PREF_KEY, mName);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>  HomePage()));
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}


