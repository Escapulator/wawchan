import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Home.dart';

Widget footerWidget(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    height: MediaQuery.of(context).size.height * .03,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.home),
          color: Color(0xff0A1637),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Home(),
            ));
          },
        ),
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.local_library),
          color: Color(0xff0A1637),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Home(),
            ));
          },
        ),
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.notifications),
          color: Color(0xff0A1637),
          onPressed: () {},
        )
      ],
    ),
  );
}
