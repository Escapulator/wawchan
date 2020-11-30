import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart';
import 'package:translator/translator.dart';
import 'package:wawchan/Services/wp_api.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';
import 'package:wawchan/Widgets/appDrawer.dart';

class Tes extends StatefulWidget {
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String title;
  final String imageUrl;
  final String index;
  Tes(
      {this.post,
      this.chapter,
      this.category,
      this.id,
      this.title,
      this.name,
      this.index,
      this.imageUrl});
  @override
  _TesState createState() => _TesState();
}

class _TesState extends State<Tes> {
  double size = 16;
  int offset = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FlutterTts flutterTts = FlutterTts();
  stop() async {
    print('Stop');
    await flutterTts.stop();
  }

  void upset() {
    setState(() {
      offset = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 45), upset);
    print('done');
  }

  @override
  Widget build(BuildContext context) {
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
                      read: widget.post,
                      id: widget.id,
                      chapter: widget.chapter,
                      category: widget.category,
                      name: widget.name,
                    )),
          ),
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
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
      body: FutureBuilder(
        future: fetchPosts(10, widget.id, 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Map wpPosts = snapshot.data[index];
                  String excerpt = wpPosts['post_content'];
                  String chapter = wpPosts['title'];
                  String category = wpPosts['category'];
                  String imageurl = wpPosts['category_image'];
                  List image = wpPosts['images'];
                  int id = wpPosts['category_id'];

                  String body = excerpt;
                  String r = body.replaceAll(
                      'Previous | Table of Contents | Next', '\n');
                  String re = r.replaceAll('\n\n\n\n', '\n\n');
                  String read = parse((re.toString())).documentElement.text;
                  return SingleChildScrollView(
                    child: Text(read),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
