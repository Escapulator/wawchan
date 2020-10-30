import 'package:flutter/material.dart';
import 'package:wawchan/Authentication/Payment.dart';

Widget monster(BuildContext context) {
  int pay = 100;
  return Column(
    children: [
      Text('The One Eyed Monster'),
      Image.asset(
        'assets/geh.png',
        height: MediaQuery.of(context).size.height * .1,
      ),
      Text('\$100/month'),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Payment(
                    pay: pay,
                  )));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .85,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff925734), width: 2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Color(0xff01C606),
                  ),
                  Flexible(
                    child: Text(
                      'Access to Hand Solo Privileges',
                      style: TextStyle(color: Color(0xff925734), fontSize: 13),
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
                      'Discuss story points and have the opportunity to influence my decisions. Once a month, you can request a single piece of content',
                      style: TextStyle(color: Color(0xff925734), fontSize: 13),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Color(0xff01C606),
                  ),
                  Flexible(
                    child: Text(
                      'I will link/advertise your website of choice in my affiliates',
                      style: TextStyle(color: Color(0xff925734), fontSize: 13),
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
