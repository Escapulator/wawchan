import 'package:flutter/material.dart';

Widget categoriesButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10),
    ),
    width: MediaQuery.of(context).size.width * .2,
    height: MediaQuery.of(context).size.height * .02,
    alignment: Alignment.center,
    child: Text(
      label,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
    ),
  );
}
