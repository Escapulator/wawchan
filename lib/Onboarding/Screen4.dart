import 'package:flutter/material.dart';
import 'package:wawchan/Authentication/Login.dart';
import 'package:wawchan/Membership/Memberships.dart';
import 'package:wawchan/Screens/Home.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset('assets/reader.PNG'),
          ),
          Text(
            'Start your Journey with Books',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Lets get you Started'),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .07,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: Color(0xff01C606),
              child: Container(
                  child: Text(
                'Sign Up for Membership',
                style: TextStyle(color: Colors.white),
              )),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Membership(),
                ));
              },
            ),
          ),
          Text(
            'Or',
            style: TextStyle(color: Color(0xff979797), fontSize: 20),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .07,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff01C606), width: 4),
              borderRadius: BorderRadius.circular(50),
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: Colors.white,
              child: Container(child: Text('Maybe Later')),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member?'),
                FlatButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0xff01C606)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
