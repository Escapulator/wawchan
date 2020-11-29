import 'package:flutter/material.dart';
import 'package:wawchan/Services/wp_api.dart';
import 'package:wawchan/Widgets/CategoryList.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 10,
        child: FutureBuilder(
          future: fetchtitle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map wpPosts = snapshot.data[index];
                    int id = wpPosts['id'];
                    String name = wpPosts['name'];
                    String imagess = wpPosts['image'];
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CategoryList(
                                      id: id,
                                      name: name,
                                      image: imagess,
                                    )));
                          },
                          child: Column(
                            children: [
                              FadeInImage(
                                image: NetworkImage(imagess),
                                placeholder: AssetImage('assets/cover.png'),
                                imageErrorBuilder:
                                    (context, error, stackTrace) =>
                                        Image.asset('assets/cover.png'),
                                placeholderErrorBuilder:
                                    (context, error, stackTrace) =>
                                        Image.asset('assets/cover.png'),
                                height: MediaQuery.of(context).size.height * .2,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  child: Text(
                                    wpPosts['name'],
                                    style: TextStyle(fontSize: 11),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
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
