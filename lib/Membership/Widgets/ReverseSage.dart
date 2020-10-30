import 'package:flutter/material.dart';
import 'package:wawchan/Authentication/Payment.dart';

Widget reverseSage(BuildContext context) {
  int pay = 15;
  return Column(
    children: [
      Text('Reverse Sage'),
      Image.asset(
        'assets/geh.png',
        height: MediaQuery.of(context).size.height * .1,
      ),
      Text('\$15/month'),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Payment(
                    pay: pay,
                  )));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .15,
          width: MediaQuery.of(context).size.width * .4,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4300FC), width: 2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Color(0xff01C606),
                  ),
                  Flexible(
                    child: Text(
                      'Access to Power Fapper Privileges',
                      style: TextStyle(color: Color(0xff4300FC), fontSize: 13),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Color(0xff01C606),
                  ),
                  Flexible(
                    child: Text(
                      'Access to all bonus chapters written for the eBooks.',
                      style: TextStyle(color: Color(0xff4300FC), fontSize: 13),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
