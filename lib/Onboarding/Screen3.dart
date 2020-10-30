import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            'Create your own library',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Center(
            child: Image.asset(
              'assets/walker.PNG',
              width: MediaQuery.of(context).size.width * .8,
            ),
          ),
        ),
      ],
    );
  }
}
