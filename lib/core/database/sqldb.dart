
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/query.dart';



class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String path = join('assets', "database.db");
      Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    // print("onUpgrade ================");
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "Tasks" (
  "ID"  INTEGER,
  "Name"  TEXT,
  "Decription"  TEXT,
  "TaskDate"  TEXT,
  "CategoryID"  INTEGER,
  "Priority"  TEXT CHECK("Priority" IN ('High', 'Medium', 'Low')),
  "Status"  TEXT CHECK("Status" IN ('Pending', 'Expired', 'Postponed')),
  "IsActive"  INTEGER CHECK("IsActive" IN (0, 1)),
  "ImpDate"  TEXT,
  PRIMARY KEY("ID" AUTOINCREMENT),
  FOREIGN KEY("CategoryID") REFERENCES "Category"("ID")
);
''');
  }

  Future<List<Map>> selectData(
      {required String table,
      String where = "",
      String customfields = "*"}) async {
    Query query = Query(table: table, where: where, customfields: customfields);
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(query.select());
    return Future.value(response);
  }

  Future<int> insertData(
      {required String table, required List<Map<String, dynamic>> data}) async {
    Query query = Query(table: table);
    Database? mydb = await db;
    int response = await mydb!.rawInsert(query.insert(values: data));
    return Future.value(response);
  }

  Future<int> insertDataqq(String qq) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(qq);
    return Future.value(response);
  }

  Future<int> updateData({
    required String table,
    required Map<String, dynamic> data,
    String where = "",
  }) async {
    Query query = Query(table: table, where: where);
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(query.update(data: data));
    return Future.value(response);
  }

  Future<int> deleteData({
    required String table,
    String where = "",
  }) async {
    Query query = Query(table: table, where: where);
    Database? mydb = await db;
    int response = await mydb!.rawDelete(query.delete());
    return Future.value(response);
  }
}
