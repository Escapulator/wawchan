import 'package:flutter/material.dart';
import 'package:wawchan/Screens/Read.dart';
import 'package:wawchan/Services/wp_api.dart';

class CategoryList extends StatefulWidget {
  final String name;
  final int id;
  final String image;
  CategoryList({this.id, this.name, this.image});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    int offset = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name, style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Color(0xff01C606)),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .2,
            child: Image.network(
              widget.image,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .68,
            child: FutureBuilder(
              future: fetchPosts(100, widget.id, offset),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Map wpPosts = snapshot.data[index];
                        String excerpt = wpPosts['post_content'];
                        String chapter = wpPosts['title'];
                        String category = wpPosts['categoryList'];
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 5,
                                      ),
                                      color: Color(0xff333333),
                                      child: Text(
                                        chapter,
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
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
      ),
    );
  }
}
