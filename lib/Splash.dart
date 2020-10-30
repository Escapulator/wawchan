import 'dart:async';
//import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wawchan/Library/Library.dart';
import 'package:wawchan/Onboarding/Onboard.dart';
import 'package:wawchan/Screens/Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences sharedPreferences;
  //final Connectivity _connectivity = Connectivity();
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
              builder: (BuildContext context) => Onboarding(),
            ),
            (Route<dynamic> route) => false);
      } else {
        /* var result = await _connectivity.checkConnectivity();
        result == ConnectivityResult.none
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => Library()),
                (Route<dynamic> route) => false)
            : */
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (Route<dynamic> route) => false);
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
