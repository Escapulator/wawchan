import 'package:flutter/material.dart';
import 'package:wawchan/Services/wp_api.dart';
import 'package:wawchan/Widgets/CategoryList.dart';

class OngoingStories extends StatefulWidget {
  @override
  _OngoingStoriesState createState() => _OngoingStoriesState();
}

class _OngoingStoriesState extends State<OngoingStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Ongoing Releases',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: new IconThemeData(color: Color(0xff01C606)),
        ),
        body: FutureBuilder(
          future: fetchtitle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map wpPosts = snapshot.data[index];
                    int id = wpPosts['id'];
                    String name = wpPosts['name'];
                    // var imageurl = wpPosts['images'] == 'null'
                    //   ? Image.asset('assets/imagez.png')
                    // : Image.network(wpPosts['images']);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CategoryList(id: id, name: name)));
                          },
                          child: //Column(
                              //children: [
                              /* FadeInImage.assetNetwork(
                                        height:
                                            MediaQuery.of(context).size.height * .12,
                                        width: MediaQuery.of(context).size.width * .3,
                                        placeholder: 'assets/imagez.png',
                                        image: imageurl), */
                              //imageurl,
                              Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.height * .15,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imagez.png',
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                ),
                                Text(
                                  wpPosts['name'],
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                          //],
                          //),
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
