import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Read.dart';
import 'package:wawchan/Services/wp_api.dart';

class AppDrawer extends StatefulWidget {
  final int id;
  final String name;
  AppDrawer({this.id, this.name});
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    int offset = 10;
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .9,
      child: Drawer(
          child:
              /* DrawerHeader(
              child: Image.asset(
                'assets/imagez.png',
                height: MediaQuery.of(context).size.height * .2,
              ),
            ), */
              Column(
        children: [
          DrawerHeader(
            child: Image.asset('assets/imagez.png',
                height: MediaQuery.of(context).size.height * .2),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .6,
            child: FutureBuilder(
              future: fetchPosts(600, widget.id, offset),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Map wpPosts = snapshot.data[index];
                        String excerpt = wpPosts['post_content'];
                        String chapter = wpPosts['title'];
                        String category = wpPosts['category'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Read(
                                          post: excerpt,
                                          id: widget.id,
                                          chapter: chapter,
                                          category: category,
                                          name: category,
                                        )));
                              },
                              title: Text(
                                chapter,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                          ],
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
