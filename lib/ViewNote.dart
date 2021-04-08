import 'dart:io';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Widgets/LibsDialog.dart';

class ViewNote extends StatefulWidget {
  final Journal journal;

  ViewNote({this.journal});
  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  double size = 16;
  String title;
  String body;
  String category;
  int id;

  @override
  void initState() {
    title = widget.journal.chapter;
    body = widget.journal.post;
    category = widget.journal.category;
    id = widget.journal.id;
    super.initState();
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleTranslator translator = GoogleTranslator();
  translate(String body) async {
    await translator.translate(body, from: 'en', to: 'hi').then((output) {
      setState(() {
        body = output.toString();
        print(body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          category,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
        elevation: 0,
        actions: [
          Platform.isIOS
              ? IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => LibsDialog(
                            read: body,
                            chapter: title,
                            id: id,
                            category: category,
                            name: '2',
                          )),
                )
              : Container(),
        ],
      ),
      persistentFooterButtons: [
        Container(
          height: MediaQuery.of(context).size.height * .05,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'T',
                style: TextStyle(fontSize: 16),
              ),
              Slider(
                min: 16,
                max: 25,
                value: size,
                onChanged: (double newsize) {
                  setState(() {
                    size = newsize;
                  });
                },
              ),
              Text(
                'T',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        )
      ],
      body: Container(
        height: MediaQuery.of(context).size.height * 0.83,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .72,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    body,
                    style: TextStyle(fontSize: 16, height: 1),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
