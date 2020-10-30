import 'package:flutter/material.dart';

Widget bigButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Color(0xff01C606),
      borderRadius: BorderRadius.circular(20),
    ),
    width: MediaQuery.of(context).size.width * .9,
    height: MediaQuery.of(context).size.height * .08,
    alignment: Alignment.center,
    child: Text(
      label,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
    ),
  );
}
