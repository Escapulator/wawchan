import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';
import 'package:wawchan/Widgets/appDrawer.dart';

class Cartoons extends StatefulWidget {
  final List images;
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String title;
  final String imageUrl;
  final int index;
  final List sample;

  Cartoons({
    this.images,
    this.post,
    this.chapter,
    this.category,
    this.id,
    this.title,
    this.name,
    this.index,
    this.imageUrl,
    this.sample,
  });
  @override
  _CartoonsState createState() => _CartoonsState();
}

class _CartoonsState extends State<Cartoons> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = true;
  double size = 16;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // PageController controller = PageController(viewportFraction: 1, keepPage: true,initialPage: widget.index );

  @override
  void initState() {
    print('hello :${widget.post}');
    print('hello :${widget.sample}');
    super.initState();
  }

  stop() async {
    print('Stop');
    await flutterTts.stop();
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
                      //read: read,
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
      body: PageView.builder(
          reverse: true,
          controller: PageController(
              viewportFraction: 1, keepPage: true, initialPage: widget.index),
          itemCount: widget.sample.length,
          itemBuilder: (context, index) {
            List body = widget.sample[index]['images'];

            return SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Image.network(body[0])),
            );
          }),
    );
  }
}
