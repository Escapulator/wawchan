import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Anoda.dart';
import 'package:wawchan/Screens/Cartoons.dart';
import 'package:wawchan/Services/wp_api.dart';

class AppDrawer extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  AppDrawer({this.id, this.name, this.image});
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    int offset = 1;
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .9,
      child: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            child: FadeInImage(
              image: NetworkImage(widget.image),
              placeholder: AssetImage('assets/cover.png'),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/cover.png'),
              placeholderErrorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/cover.png'),
              height: MediaQuery.of(context).size.height * .2,
            ),
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
                        List image = wpPosts['images'];
                        int id = wpPosts['category_id'];
                        String imageurl = wpPosts['category_image'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                category == 'Isekai no Monogatari'
                                    ? Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Cartoons(
                                                  images: image,
                                                  post: excerpt,
                                                  chapter: chapter,
                                                  category: category,
                                                  imageUrl: imageurl,
                                                  id: id,
                                                )))
                                    : Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) => Anoda(
                                          post: excerpt,
                                          chapter: chapter,
                                          category: category,
                                          id: id,
                                          imageUrl: imageurl,
                                          sample: snapshot.data,
                                          index: index,
                                        ),
                                      ));
                              },
                              title: Text(
                                chapter,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
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
