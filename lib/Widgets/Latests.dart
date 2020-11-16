import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Read.dart';
import 'package:wawchan/Services/wp_api.dart';

class Latests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset;
    int id;
    return Material(
        elevation: 10,
        child: FutureBuilder(
          future: fetchPosts(10, id, offset),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map wpPosts = snapshot.data[index];
                    String excerpt = wpPosts['post_content'];
                    String chapter = wpPosts['title'];
                    String category = wpPosts['category'];
                    String imageurl = wpPosts['category_image'];
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Read(
                                post: excerpt,
                                chapter: chapter,
                                category: category,
                              ),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                            child: Column(
                              children: [
                                FadeInImage(
                                  image: NetworkImage(imageurl),
                                  placeholder: AssetImage('assets/imagez.png'),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) =>
                                          Image.asset('assets/imagez.png'),
                                  placeholderErrorBuilder:
                                      (context, error, stackTrace) =>
                                          Image.asset('assets/imagez.png'),
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  child: Text(
                                    chapter,
                                    style: TextStyle(fontSize: 12),
                                    maxLines: 4,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .01,
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
        ));
  }
}
