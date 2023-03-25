import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wed_guru/model/pmodel.dart';


class DatabaseProvider {
  DatabaseProvider.__privateConstructor();

  static final DatabaseProvider db = DatabaseProvider.__privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE USER ("
            "id INTEGER PRIMARY KEY,"
            "name TEXT,"
            "gender TEXT,"
            "city TEXT,"
            "description TEXT,"
            "isLiked INTEGER"
            ")");
/*
        await db.execute(
          "INSERT INTO USER ('id', 'name', 'gender', 'city', 'description') values (?,?,?,?,?)",
          [1, 'Ramesh', 'Male', 'Rajkot', 'Nothing'],
        );

        await db.execute(
          "INSERT INTO USER ('id', 'name', 'gender', 'city', 'description') values (?,?,?,?,?)",
          [2, 'Sureah', 'Male', 'Jamnagar', 'Human'],
        );

        await db.execute(
          "INSERT INTO USER ('id', 'name', 'gender', 'city', 'description') values (?,?,?,?,?)",
          [3, 'Kajal', 'Female', 'Rajkot', 'Something'],
        );

        await db.execute(
          "INSERT INTO USER ('id', 'name', 'gender', 'city', 'description') values (?,?,?,?,?)",
          [4, 'Priya', 'Female', 'Jamnagar', 'Human'],
        );*/
      },
    );
  }

  // get all users method
  Future<List<User>> getAllUsers() async {
      final db = await database;
    List<Map> results =
    await db.query("User", columns: User.columns, orderBy: "id ASC");
    List<User> users = [];
      print("${results.length} sdfsssd");
    for (var result in results) {
      User user = User.fromMap(result as Map<String, dynamic>);
      users.add(user);
    }
    print("${users.length} sdfsd");
    return users;
  }

  //get user by id
  Future<User?> getUserById(int id) async {
    final db = await database;
    var result = await db.query("User", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  //insert user
  Future<int> insert(User user) async {
    final db = await database;
    var maxIdResult =
    await db.rawQuery("SELECT MAX(id+1) as last_inserted_id FROM User");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
      "INSERT into User (id, name, gender, city, description,isLiked) VALUES (?,?,?,?,?,?)",
      [id, user.name, user.gender, user.city, user.description ,user.isliked ? 1:0],
    );
    print(result);
    return result;
  }

  //update user
  Future<int>update(User user) async {
    final db = await database;
    var result = await db
        .update("User", user.toMap(), where: "id = ?", whereArgs: [user.id]);
    return result;
  }
Future<void> likedUpdate(User user )async{
    final db = await database;
    var result = await db
        .update("User", user.toMap(), where: "id = ?", whereArgs: [user.id]);
}

  //delete user
  delete(int id) async {
    final db = await database;
    db.delete("User", where: "id = ?", whereArgs: [id]);
  }
}
