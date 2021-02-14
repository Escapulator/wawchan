class FavouriteModel {
  int id;
  String category;
  String image;

  favouriteModelMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['category'] = category;
    mapping['image'] = image;
    return mapping;
  }
}
