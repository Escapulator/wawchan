import 'package:flutter/material.dart';
import 'package:wawchan/Shared/buttons.dart';

class Completed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment Successful',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 270,
            ),
            Text(
              'Payment Successful',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'Home', (_) => false);
              },
              child: bigButton(context, 'Back Home'),
            )
          ],
        ),
      ),
    );
  }
}
