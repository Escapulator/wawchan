import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wawchan/Model/FavModel.dart';
import 'package:wawchan/Screens/Anoda.dart';
import 'package:wawchan/Screens/Cartoons.dart';
import 'package:wawchan/Services/Favourites.dart';
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
  SharedPreferences sharedPreferences;
  String bookmarked;

  getBookmarked() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String book = sharedPreferences.getString("Bookmarks");
    setState(() {
      bookmarked = book;
    });
    print(bookmarked);
  }

  @override
  void initState() {
    super.initState();
    getBookmarked();
  }

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
          Center(
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Add to Favorite'),
                color: Color(0xff01C606),
                onPressed: () async {
                  var favObject = FavouriteModel();
                  favObject.id = widget.id;
                  favObject.category = widget.name;
                  favObject.image = widget.image;
                  var favService = FavouriteService();
                  var result = await favService.saveFavs(favObject);
                  print(result);
                  showCorrectInfoFlushbar(context);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.68,
            child: FutureBuilder(
              future: fetchPosts(100, widget.id, offset),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('asd: ${snapshot.data}');
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Map wpPosts = snapshot.data[index];
                        String excerpt = wpPosts['post_content'];
                        String chapter = wpPosts['title'];
                        String category = wpPosts['category'];
                        int id = wpPosts['category_id'];
                        String imageurl = wpPosts['category_image'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  category == 'Isekai no Monogatari'
                                      ? Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Cartoons(
                                                    post: excerpt,
                                                    chapter: chapter,
                                                    category: category,
                                                    id: id,
                                                    imageUrl: imageurl,
                                                    sample: snapshot.data,
                                                    index: index,
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 5,
                                      ),
                                      color: Color(bookmarked == chapter
                                          ? 0xff01C606
                                          : 0xff333333),
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

  void showCorrectInfoFlushbar(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Download Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).accentColor,
        textColor: Colors.white,
        fontSize: 20.0);

    setState(() {});
  }
}
