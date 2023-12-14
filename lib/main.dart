import 'package:flutter/material.dart';
import 'package:flutter_sqflite_practicle/login_sharedprefs/splash_page.dart';
import 'package:flutter_sqflite_practicle/sqflite/home_db.dart';
import 'package:flutter_sqflite_practicle/sqflite_model/home_db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeDBModel(),
      //home: SplashScreen(),
    );
  }
}

