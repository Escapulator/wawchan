import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Read.dart';
import 'package:wawchan/Services/wp_api.dart';

class LatestRelease extends StatefulWidget {
  @override
  _LatestReleaseState createState() => _LatestReleaseState();
}

class _LatestReleaseState extends State<LatestRelease> {
  @override
  Widget build(BuildContext context) {
    int posts = 10;
    int offset = 10;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Latest Releases',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: new IconThemeData(color: Color(0xff01C606)),
        ),
        body: FutureBuilder(
          future: fetchPosts(posts, 0, offset),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map wpPosts = snapshot.data[index];
                    String excerpt = wpPosts['post_content'];
                    String chapter = wpPosts['title'];
                    String category = wpPosts['category'];
                    // var imageurl = wpPosts['images'] == 'null'
                    //   ? Image.asset('assets/imagez.png')
                    // : Image.network(wpPosts['images']);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Column(
                            children: [
                              /* FadeInImage.assetNetwork(
                                        height:
                                            MediaQuery.of(context).size.height * .12,
                                        width: MediaQuery.of(context).size.width * .3,
                                        placeholder: 'assets/imagez.png',
                                        image: imageurl), */
                              //imageurl,
                              Text(
                                category,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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
        ));
  }
}
