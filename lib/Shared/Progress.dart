import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String status;
  Progress({this.status});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff01C606))),
              SizedBox(
                width: MediaQuery.of(context).size.width * .03,
              ),
              Text(
                status,
                style: TextStyle(fontSize: 25, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
