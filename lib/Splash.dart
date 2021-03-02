import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wawchan/Authentication/Login.dart';
import 'package:wawchan/Screens/Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() {
    Timer(Duration(seconds: 3), () async {
      print('Baby Hello');
      sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences.getString("token") == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Login(),
            ),
            (Route<dynamic> route) => false);
      } else {
        if ((sharedPreferences.getInt('day') + 7) <= DateTime.now().day ||
            sharedPreferences.getInt('month') != DateTime.now().month) {
          sharedPreferences.clear();
          print('cleared');
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Login()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              (Route<dynamic> route) => false);
        }
      }
    });
  }

  ///
  ///Create an int for the size, and run a function to increase the size of the image
  ///After it gets to a point, begin to decrease the size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/splash.png',
      ),
    ));
  }
}
