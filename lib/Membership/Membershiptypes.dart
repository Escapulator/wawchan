import 'package:flutter/material.dart';
import 'package:wawchan/Membership/Widgets/ChronicMB.dart';
import 'package:wawchan/Membership/Widgets/HandSolo.dart';
import 'package:wawchan/Membership/Widgets/Masterbaiter.dart';
import 'package:wawchan/Membership/Widgets/Monster.dart';
import 'package:wawchan/Membership/Widgets/Onaniphile.dart';
import 'package:wawchan/Membership/Widgets/PowerFapper.dart';
import 'package:wawchan/Membership/Widgets/ReverseSage.dart';

class MemTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Pick your Subscription',
          style: TextStyle(color: Color(0xff2C2C2C)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height * .9,
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [masterbaiter(context), chronicMB(context)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [powerFapper(context), reverseSage(context)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [onaniphile(context), handSolo(context)],
                ),
                monster(context)
              ],
            ),
          )),
    );
  }
}
