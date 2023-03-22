// do not use

// import 'dart:io';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:wed_guru/model/persons.dart';
// import 'package:wed_guru/model/pmodel.dart';
//
//
//
// class DatabaseHelper {
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//
//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();
//
//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'persons.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE persons(
//           id INTEGER PRIMARY KEY,
//           name TEXT,
//           age INTEGER,
//           phone INTEGER,
//           city TEXT,
//           description TEXT
//       )
//       ''');
//   }
//   Future<List<Persons>> getPersons() async {
//     Database db = await instance.database;
//     var persons = await db.query('persons', orderBy: 'name');
//     List<Persons> personsList = persons.isNotEmpty
//         ? persons.map((c) => Persons.fromMap(c)).toList()
//         : [];
//     return personsList;
//   }
//
//   Future<int> add(Persons persons) async {
//     Database db = await instance.database;
//     return await db.insert('persons', persons.toMap());
//   }
//
//   Future<int> remove(int id) async {
//     Database db = await instance.database;
//     return await db.delete('persons', where: 'id = ?', whereArgs: [id]);
//   }
//
//   Future<int> update(Persons persons) async {
//     Database db = await instance.database;
//     return await db.update('persons', persons.toMap(),
//         where: "id = ?", whereArgs: [persons.id]);
//   }
//
// }