import 'dart:io';
import 'package:databaseintro/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static final _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'usertable';
  final String columnID = 'id';
  final String username = 'username';
  final String password = 'password';
  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "maindb.db");
    var ourDb = await openDatabase(path, version: 3, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName( $columnID INTEGER PRIMARY KEY, $username TEXT, $password TEXT)");
  }

  //CRUD - CREATE, READ, UPDATE, DELETE
  //Insertion
  Future<int> saverUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", user.toMap());
    return res;
  }

  //Get Users
  Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE $columnID = $id");

    if (result.length == 0) return null;
    return new User.fromMap(result.first);
  }

  //Delete
  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .delete('$tableName', where: "$columnID = ?", whereArgs: [id]);
    return result;
  }

  //Update

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    var result = await dbClient.update(tableName, user.toMap(),
        where: "$columnID = ?", whereArgs: [user.id]);
    return result;
  }

//close
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
