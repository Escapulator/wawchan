import 'package:sqflite/sqflite.dart';
import 'package:wawchan/Utils/Database.dart';

class Repo {
  DatabaseConnection databaseConnection;

  Repo() {
    databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await databaseConnection.setDatabase();
    return database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}
