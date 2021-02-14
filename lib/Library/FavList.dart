import 'package:flutter/material.dart';
import 'package:wawchan/Model/FavModel.dart';
import 'package:wawchan/Services/Favourites.dart';
import 'package:wawchan/Widgets/CategoryList.dart';

class FavList extends StatefulWidget {
  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  FavouriteService favouriteService;

  List<FavouriteModel> _favlist = List<FavouriteModel>();

  @override
  initState() {
    super.initState();
    getjournal();
  }

  getjournal() async {
    favouriteService = FavouriteService();
    _favlist = List<FavouriteModel>();

    var joruna = await favouriteService.readFavs();

    joruna.forEach((journals) {
      setState(() {
        var model = FavouriteModel();
        model.id = journals['id'];
        model.category = journals['category'];
        model.image = journals['image'];
        _favlist.add(model);
      });
    });
  }

  delete(BuildContext context, id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            actions: [
              RaisedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.green[200],
              ),
              RaisedButton(
                child: Text('Delete'),
                onPressed: () async {
                  var result = await favouriteService.deleteFavs(id);
                  if (result > 0) {
                    Navigator.of(context).pop();
                    getjournal();
                    //get a snackbar to show
                  }
                },
              )
            ],
            title: Text('Are you sure you want to delete this?'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //final post = Provider.of<List<Journal>>(context);
    return (_favlist.length > 0)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Bookmarks',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: new IconThemeData(color: Color(0xff01C606)),
            ),
            body: ListView.builder(
                itemCount: _favlist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          color: Color(0xff333333),
                          child: Text(
                            _favlist[index].category,
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryList(
                                id: _favlist[index].id,
                                name: _favlist[index].category,
                                image: _favlist[index].image,
                              )));
                    },
                    onLongPress: () {
                      delete(context, _favlist[index].id);
                    },
                  );
                }),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Library',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: new IconThemeData(color: Color(0xff01C606)),
            ),
            body: Center(
              child: Text('No Favorites Yet'),
            ),
          );
  }
}
