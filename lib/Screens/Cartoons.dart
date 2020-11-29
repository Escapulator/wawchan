import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wawchan/Widgets/appDrawer.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';

class Cartoons extends StatefulWidget {
  final List images;
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String imageUrl;
  Cartoons(
      {this.images,
      this.post,
      this.chapter,
      this.category,
      this.id,
      this.name,
      this.imageUrl});
  @override
  _CartoonsState createState() => _CartoonsState();
}

class _CartoonsState extends State<Cartoons> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = true;
  double size = 16;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List body = widget.images;

    print(body);

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
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AuthDialog(
                      //read: body,
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
              translate(Cartoons);
            },
          ) */
        ],
      ),
      endDrawer: AppDrawer(
        name: widget.name,
        id: widget.id,
        image: widget.imageUrl,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Image.network(body[0])),
      ),
    );
  }
}
