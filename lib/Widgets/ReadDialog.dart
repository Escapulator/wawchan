import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    print(widget.read);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(width: 120, child: _buildChild(context)),
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

    return Platform.isIOS
        ? Container(
            height: MediaQuery.of(context).size.height * .18,
            width: 120,
            //alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent),
            child: Column(children: [
              Container(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                    color: Color(0xff01C606),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[700], width: 1.5)),
                child: Center(
                  child: DrawNav(),
                ),
              ),
              widget.category != 'Isekai no Monogatari'
                  ? Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Color(0xff01C606),
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey[700], width: 1.5)),
                      child: RaisedButton(
                        onPressed: () async {
                          var journalObject = Journal();

                          journalObject.id = widget.id;
                          journalObject.name = widget.name;
                          journalObject.category = widget.category;
                          journalObject.post = widget.read;
                          journalObject.chapter = widget.chapter;

                          var journalService = JournalService();
                          var result =
                              await journalService.saveJournal(journalObject);

                          print(result);
                        },
                        color: Color(0xff01C606),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.grey[700], width: 1.5)),
                        child: Text(
                          'Download',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 70,
                    child: RaisedButton(
                      color: Color(0xff01C606),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              BorderSide(color: Colors.grey[700], width: 1.5)),
                      onPressed: () {
                        isPlaying ? notReading() : speak();
                      },
                      child: isPlaying
                          ? Center(
                              child: Text(
                                'Pause',
                                style: TextStyle(fontSize: 13),
                              ),
                            )
                          : Center(
                              child: Text(
                                'Read',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    child: RaisedButton(
                        color: Color(0xff01C606),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.grey[700], width: 1.5)),
                        onPressed: () {
                          stop();
                        },
                        child: Center(
                          child: Text(
                            'Stop',
                            style: TextStyle(fontSize: 15),
                          ),
                        )),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 140,
                child: RaisedButton(
                    color: Color(0xff01C606),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey[700], width: 1.5)),
                    onPressed: () async {
                      SharedPreferences _shared =
                          await SharedPreferences.getInstance();
                      _shared.setString('Bookmarks', widget.chapter);
                      print(_shared);
                    },
                    child: Text(
                      'Bookmark',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
            ]))
        : Container(
            height: MediaQuery.of(context).size.height * .176,
            width: MediaQuery.of(context).size.width * .1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Color(0xff01C606),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[700], width: 1.5)),
                  child: Center(
                    child: DrawNav(),
                  ),
                ),
                widget.category != 'Isekai no Monogatari'
                    ? Container(
                        height: 40,
                        width: 120,
                        child: RaisedButton(
                          color: Color(0xff01C606),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Colors.grey[700], width: 1.5)),
                          onPressed: () async {
                            var journalObject = Journal();

                            journalObject.id = widget.id;
                            journalObject.name = widget.name;
                            journalObject.category = widget.category;
                            journalObject.post = widget.read;
                            journalObject.chapter = widget.chapter;

                            var journalService = JournalService();
                            var result =
                                await journalService.saveJournal(journalObject);

                            print(result);
                          },
                          child: Text(
                            'Download',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  height: 40,
                  width: 120,
                  child: RaisedButton(
                      color: Color(0xff01C606),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side:
                              BorderSide(color: Colors.grey[700], width: 1.5)),
                      onPressed: () async {
                        SharedPreferences _shared =
                            await SharedPreferences.getInstance();
                        _shared.setString('Bookmarks', widget.chapter);
                        print(_shared);
                      },
                      child: Text(
                        'Bookmark',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ));
  }
}
