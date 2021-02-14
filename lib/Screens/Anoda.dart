import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart';
import 'package:wawchan/Widgets/ReadDialog.dart';
import 'package:wawchan/Widgets/appDrawer.dart';

class Anoda extends StatefulWidget {
  final String post;
  final String chapter;
  final String category;
  final int id;
  final String name;
  final String title;
  final String imageUrl;
  final int index;
  final List sample;

  Anoda({
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
  _AnodaState createState() => _AnodaState();
}

class _AnodaState extends State<Anoda> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = true;
  String reads;
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
    var reversedList = new List.from(widget.sample.reversed);
    return Scaffold(
      body: PageView.builder(
          reverse: true,
          controller: PageController(
              viewportFraction: 1, keepPage: true, initialPage: widget.index),
          itemCount: widget.sample.length,
          itemBuilder: (context, index) {
            String body = widget.sample[index]['post_content'];
            String r =
                body.replaceAll('Previous | Table of Contents | Next', '\n');
            String re = r.replaceAll('\n\n\n\n', '\n\n');
            String read = parse((re.toString())).documentElement.text;

            String title = widget.sample[index]['title'];
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
                              chapter: title,
                              category: widget.category,
                              name: widget.name,
                            )),
                  ),
                  IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () =>
                          _scaffoldKey.currentState.openEndDrawer()),
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
              body: Container(
                height: double.infinity,
                child: Column(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .72,
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          child: Text(
                            read,
                            style: TextStyle(
                              fontSize: size,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

//Try to use setstate to change what in the read widget and see
