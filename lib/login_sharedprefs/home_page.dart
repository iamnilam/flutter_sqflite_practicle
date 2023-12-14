import 'package:flutter/material.dart';
import 'package:flutter_sqflite_practicle/login_sharedprefs/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    GetUserName();
  }

  void GetUserName() async{
    var prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString(LoginPage.USERNAME_PREF_KEY);
    name = userName!;
    var appOpenCount = prefs.getInt(LoginPage.APP_OPEN_PRE_KEY);

    if(appOpenCount != null){
      appOpenCount++;
    }else{
      appOpenCount = 0;
      appOpenCount++;
    }

    prefs.setInt(LoginPage.APP_OPEN_PRE_KEY, appOpenCount);

    count = appOpenCount;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: count%3==0 ? Colors.green.shade200 : Colors.blue,
        title: Text("Home Open App Count $count"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name== "" ? "" : "Welcome, $name ",style: TextStyle(fontSize: 25),),
            SizedBox(height: 20,),
            Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            ElevatedButton(onPressed: ()async{
              singOutUser();
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  void singOutUser() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(LoginPage.LOGIN_PREF_KEY, false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
