import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Services/libs.dart';
import 'package:wawchan/main.dart';

class AuthDialog extends StatefulWidget {
  final String read;
  final String chapter;
  final String category;
  final int id;
  final String name;
  AuthDialog({this.read, this.category, this.chapter, this.id, this.name});
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    String read = widget.read;
    speak() async {
      await flutterTts.setLanguage('en-GB');
      await flutterTts.setPitch(1);
      await flutterTts.speak(read);
      setState(() {
        isPlaying = true;
      });
      print('Reciting');
    }

    notReading() async {
      await flutterTts.pause();
      print('Paused');
      setState(() {
        isPlaying = false;
      });
      print('Not reciting');
    }

    return Container(
        padding: EdgeInsets.all(20),
        height: Platform.isAndroid
            ? MediaQuery.of(context).size.height * .28
            : MediaQuery.of(context).size.height * .22,
        width: MediaQuery.of(context).size.width * .4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff01C606)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawNav(),
            FlatButton(
              child: isPlaying ? Text('Pause') : Text('Read'),
              onPressed: () {
                isPlaying ? notReading() : speak();
              },
            ),
            FlatButton(
                child: Text('Add to Favourites'),
                onPressed: () async {
                  var journalObject = Journal();

                  journalObject.id = widget.id;
                  journalObject.name = widget.name;
                  journalObject.category = widget.category;
                  journalObject.post = widget.read;
                  journalObject.chapter = widget.chapter;

                  var journalService = JournalService();
                  var result = await journalService.saveJournal(journalObject);

                  print(result);
                })
          ],
        ));
  }
}
