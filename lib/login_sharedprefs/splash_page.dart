import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_practicle/login_sharedprefs/home_page.dart';
import 'package:flutter_sqflite_practicle/login_sharedprefs/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10), () async {
      var prefs = await SharedPreferences.getInstance();
      bool? checkLogin = prefs.getBool(LoginPage.LOGIN_PREF_KEY);

      Widget navigateTo = LoginPage();

      if (checkLogin != null && checkLogin) {
        navigateTo =  HomePage();
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.ac_unit_outlined,
              size: 34,
              color: Colors.white,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Classion",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
