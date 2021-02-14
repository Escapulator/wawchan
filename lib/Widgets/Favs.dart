import 'package:flutter/material.dart';
import 'package:wawchan/Model/FavModel.dart';
import 'package:wawchan/Services/Favourites.dart';
import 'package:wawchan/Widgets/CategoryList.dart';

class Favs extends StatefulWidget {
  @override
  _FavsState createState() => _FavsState();
}

class _FavsState extends State<Favs> {
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
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _favlist.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  InkWell(
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
                    child: Container(
                      padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/cover.png',
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .3,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Text(
                              _favlist[index].category,
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
            })
        : Center(
            child: Text('No Favorites Yet'),
          );
  }
}
