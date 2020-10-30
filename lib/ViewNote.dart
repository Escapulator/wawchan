import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';

class ViewNote extends StatefulWidget {
  final Journal journal;

  ViewNote({this.journal});
  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String title;
  String body;
  String date;

  @override
  void initState() {
    title = widget.journal.chapter;
    body = widget.journal.post;
    date = widget.journal.chapter;
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
          date,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              translate(body);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => showDialog(
                context: context, builder: (context) => AuthDialog()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            body,
            style: TextStyle(fontSize: 16, height: 1),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
