import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart';
import 'package:translator/translator.dart';
import 'package:wawchan/Services/wp_api.dart';
import 'package:wawchan/Widgets/appDrawer.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';

class Read extends StatefulWidget {
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String imageUrl;
  Read(
      {this.post,
      this.chapter,
      this.category,
      this.id,
      this.name,
      this.imageUrl});
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = true;
  double size = 16;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    GoogleTranslator translator = GoogleTranslator();
    String body = widget.post;
    String r = body.replaceAll('Previous | Table of Contents | Next', '\n');
    String re = r.replaceAll('\n\n\n\n', '\n\n');
    String read = parse((re.toString())).documentElement.text;

    stop() async {
      print('Stop');
      await flutterTts.stop();
    }

    translate(String read) async {
      await translator.translate(read, from: 'en', to: 'hi').then((output) {
        setState(() {
          read = output.toString();
          print(read);
        });
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: BackButton(onPressed: () {
          stop();
          Navigator.pop(context, false);
        }),
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AuthDialog(
                      read: read,
                      id: widget.id,
                      chapter: widget.chapter,
                      category: widget.category,
                      name: widget.name,
                    )),
          ),
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
          /* onPressed: () {
              translate(read);
            },
          ) */
        ],
      ),
      endDrawer: AppDrawer(
        name: widget.name,
        id: widget.id,
        image: widget.imageUrl,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Text(
            read,
            style: TextStyle(
              fontSize: size,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
