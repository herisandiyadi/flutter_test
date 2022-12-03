import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:test_flutter/coffee/models/order_model.dart';
import 'dart:async';

class DbOrder {
  static DbOrder? dbOrder;
  static Database? _dbase;

  DbOrder._createObject();

  factory DbOrder() {
    dbOrder ??= DbOrder._createObject();
    return dbOrder!;
  }

  Future<Database> initDbase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'orders.db');

    var todoDatabase =
        openDatabase(path, version: 1, onCreate: _createDatabase);

    return todoDatabase;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,   
        name TEXT,
        amount_bean TEXT,
        level_grind TEXT,
        level_sugar TEXT,
        amount INTEGER,
        total INTEGER,
        status TEXT,
        serve TEXT
        )
    ''');
  }

  Future<Database> get database async {
    _dbase ??= await initDbase();
    return _dbase!;
  }

  Future<List<OrderModels>> fetchData() async {
    Database db = await database;
    List data = await db.query('orders');

    return List.generate(data.length, (i) {
      return OrderModels(
        id: data[i]['id'],
        name: data[i]['name'],
        amountBean: data[i]['amount_bean'],
        levelGrind: data[i]['level_grind'],
        levelSugar: data[i]['level_sugar'],
        amount: data[i]['amount'],
        total: data[i]['total'],
        status: data[i]['status'],
        serve: data[i]['serve'],
      );
    });
  }

  Future<int> addItem(OrderModels data) async {
    Database db = await database;
    return db.insert('orders', data.toMap());
  }

  Future<int> delete(int id) async {
    Database db = await database;
    int count = await db.delete('orders', where: 'id=?', whereArgs: [id]);

    return count;
  }

  Future<int> update(OrderModels data) async {
    Database db = await database;
    int count = await db
        .update('orders', data.toJson(), where: 'id = ?', whereArgs: [data.id]);
    return count;
  }

  Future<int> clearOrder() async {
    Database db = await database;
    int count = await db.delete('orders');

    return count;
  }
}
