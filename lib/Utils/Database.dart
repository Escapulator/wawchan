import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'journal.sqlite3.db');
    var database =
        await openDatabase(path, version: 1, onCreate: createDatabase);
    return database;
  }

  createDatabase(Database database, int version) async {
    await database.execute(
        'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY, chapter TEXT, name TEXT, category TEXT, post TEXT)');
    await database.execute(
        'CREATE TABLE IF NOT EXISTS favourites(id INTEGER PRIMARY KEY, chapter TEXT, name TEXT, category TEXT, post TEXT, image Text)');
  }
}
