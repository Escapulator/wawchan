import 'package:wawchan/Model/FavModel.dart';
import 'package:wawchan/Model/Journal.dart';
import 'package:wawchan/Utils/Repository.dart';

class FavouriteService {
  Repo _repo;

  FavouriteService() {
    _repo = Repo();
  }

  saveFavs(FavouriteModel favs) async {
    return await _repo.insertData('favourites', favs.favouriteModelMap());
  }

  readFavs() async {
    return await _repo.readData('favourites');
  }

  deleteFavs(id) async {
    return await _repo.delete('favourites', id);
  }
}
