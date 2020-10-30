import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wawchan/Onboarding/Screen1.dart';
import 'package:wawchan/Onboarding/Screen2.dart';
import 'package:wawchan/Onboarding/Screen3.dart';
import 'package:wawchan/Onboarding/Screen4.dart';
import 'package:wawchan/Authentication/Login.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentpage;
  int pageLength;

  @override
  void initState() {
    super.initState();
    currentpage = 0;
    pageLength = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              physics: BouncingScrollPhysics(),
              children: [Screen1(), Screen2(), Screen3(), Screen4()],
              onPageChanged: (value) {
                setState(() {
                  currentpage = value;
                });
              },
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new DotsIndicator(
                        dotsCount: pageLength,
                        position: currentpage.toDouble(),
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color(0xff01C606)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
