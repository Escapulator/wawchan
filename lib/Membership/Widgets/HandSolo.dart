import 'package:flutter/material.dart';
import 'package:wawchan/Authentication/Payment.dart';

Widget handSolo(BuildContext context) {
  int pay = 50;
  return Column(
    children: [
      Text('Hand Solo'),
      Image.asset(
        'assets/geh.png',
        height: MediaQuery.of(context).size.height * .1,
      ),
      Text('\$50/month'),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Payment(
              pay: pay,
            ),
          ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .22,
          width: MediaQuery.of(context).size.width * .4,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff925734), width: 2),
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
                      'Access to Onaniphile Privileges',
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
                      'You\'re a major contributor to the continued production of content. You can request an illustration or a commissioned, rushed, or what-if chapter once a month',
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
