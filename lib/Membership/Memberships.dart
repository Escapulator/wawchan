import 'package:flutter/material.dart';
import 'package:wawchan/Membership/Membershiptypes.dart';

class Membership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Let\'s get you Started',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffF9F9F9),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        //padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        padding: EdgeInsets.fromLTRB(30, 60, 30, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/geh.png'),
            Text(
              'Whizawizzer is been sponsored by Patreon through your regular membership funding. I get some percentage Whizawizzer is been sponsored by Patreon through your regular membership funding. I get some percentage',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .07,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Create account with Patreon',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MemTypes(),
                  ));
                },
                color: Color(0xffF96859),
              ),
            ),
            Text(
              'Whizawizzer is been sponsored by Patreon through your regular membership funding. I get some percentage Whizawizzer is been sponsored by Patreon through your regular membership funding. I get some percentage',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .07,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Create account with FULL FRONTAL',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MemTypes(),
                  ));
                },
                color: Color(0xff01C606),
              ),
            )
          ],
        ),
      ),
    );
  }
}
