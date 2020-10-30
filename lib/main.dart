import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wawchan/Authentication/CheckoutnPay.dart';
import 'package:wawchan/Authentication/Login.dart';
import 'package:wawchan/Authentication/Payment.dart';
import 'package:wawchan/Authentication/PaymentCompleted.dart';
import 'package:wawchan/Authentication/Register.dart';
import 'package:wawchan/Screens/Home.dart';
import 'package:wawchan/Splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(brightness: brightness),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'WhawChan',
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Splash(),
            routes: {
              'Login': (BuildContext context) => new Login(),
              'Register': (BuildContext context) => new Register(),
              'Payment': (BuildContext context) => new Payment(),
              'Checkout': (BuildContext context) => new Checkout(),
              'Completed': (BuildContext context) => new Completed(),
              'Home': (BuildContext context) => new Home(),
            },
          );
        });
  }
}

class DrawNav extends StatefulWidget {
  @override
  _DrawNavState createState() => _DrawNavState();
}

class _DrawNavState extends State<DrawNav> {
  @override
  Widget build(BuildContext context) {
    bool isOn = false;
    return FlatButton(
      //value: isOn,
      child: Text(
        'Dark Theme',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        toggle();
        setState(() {
          isOn = true;
        });
      },
    );
  }

  void toggle() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
