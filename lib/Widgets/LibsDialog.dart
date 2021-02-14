import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Services/libs.dart';
import 'package:wawchan/main.dart';

class LibsDialog extends StatefulWidget {
  final String read;
  final String chapter;
  final String category;
  final int id;
  final String name;
  LibsDialog({this.read, this.category, this.chapter, this.id, this.name});
  @override
  _LibsDialogState createState() => _LibsDialogState();
}

class _LibsDialogState extends State<LibsDialog> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    print(widget.read);
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

    stop() async {
      print('Stop');
      await flutterTts.stop();
    }

    return Container(
        padding: EdgeInsets.all(20),
        height: Platform.isAndroid
            ? MediaQuery.of(context).size.height * .2
            : MediaQuery.of(context).size.height * .27,
        width: MediaQuery.of(context).size.width * .4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff01C606)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                color: Colors.green[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: DrawNav()),
            Platform.isIOS
                ? RaisedButton(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: isPlaying ? Text('Pause') : Text('Read'),
                    onPressed: () {
                      isPlaying ? notReading() : speak();
                    },
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            Platform.isIOS
                ? RaisedButton(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Stop'),
                    onPressed: () {
                      stop();
                    },
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
          ],
        ));
  }
}
