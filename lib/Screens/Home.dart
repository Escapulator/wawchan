import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wawchan/Authentication/Login.dart';
import 'package:wawchan/Library/FavList.dart';
import 'package:wawchan/Library/Library.dart';
import 'package:wawchan/Widgets/Favs.dart';
import 'package:wawchan/Widgets/LatestRelease.dart';
import 'package:wawchan/Widgets/Category.dart';
import 'package:wawchan/Widgets/Libs.dart';
import 'package:wawchan/Widgets/Latests.dart';
import 'package:wawchan/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: new IconThemeData(color: Color(0xff01C606)),
          elevation: 0,
          actions: [
            DrawNav(),
            FlatButton(
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.clear();
                print('done');
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
        //persistentFooterButtons: [footerWidget(context)],
        body: Container(
          height: MediaQuery.of(context).size.height * .9,
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .87,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Image.asset(
                'assets/splash.png',
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * .7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 14, bottom: 12),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                          height: Platform.isIOS
                              ? MediaQuery.of(context).size.height * .23
                              : MediaQuery.of(context).size.height * .25,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Category()),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest Release',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            FlatButton(
                              child: Text('View all'),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LatestRelease()));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: Platform.isIOS
                              ? MediaQuery.of(context).size.height * .28
                              : MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Latests()),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Downloads',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            FlatButton(
                              child: Text('View all'),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Library()));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: Platform.isIOS
                              ? MediaQuery.of(context).size.height * .28
                              : MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Libs()),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Favorites',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            FlatButton(
                              child: Text('View all'),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FavList()));
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: Platform.isIOS
                              ? MediaQuery.of(context).size.height * .28
                              : MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * 1,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Favs()),
                    ],
                  ),
                ))
          ]),
        ));
  }
}
