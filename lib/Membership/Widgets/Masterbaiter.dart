import 'package:flutter/material.dart';
import 'package:wawchan/Authentication/Payment.dart';

Widget masterbaiter(BuildContext context) {
  int pay = 2;
  return Column(
    children: [
      Text('Master Baiter'),
      Image.asset(
        'assets/geh.png',
        height: MediaQuery.of(context).size.height * .1,
      ),
      Text('\$2/month'),
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Payment(
              pay: pay,
            ),
          ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width * .4,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff0074FC), width: 2),
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
                      'Access to all of the locked chapters',
                      style: TextStyle(color: Color(0xff256FEA), fontSize: 13),
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
                    Icons.cancel,
                    color: Color(0xffFF0000),
                  ),
                  Flexible(
                    child: Text(
                      'Bonus and early access.',
                      style: TextStyle(color: Color(0xff256FEA), fontSize: 13),
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
                      'Commissioned images',
                      style: TextStyle(color: Color(0xff256FEA), fontSize: 13),
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
                      'membership-only stories and volumes.',
                      style: TextStyle(color: Color(0xff256FEA), fontSize: 13),
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
                      'One free E-Book per year',
                      style: TextStyle(color: Color(0xff256FEA), fontSize: 13),
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
