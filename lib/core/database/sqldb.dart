import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



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
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "netcards.db");
    print(path);
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 6, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("onUpgrade ================");
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "users" (
    "username" VARCHAR(15) NOT NULL UNIQUE ,
    "comment" TEXT ,
    "sn" TEXT ,
    "profile" TEXT NOT NULL
  )
''');
    await db.execute('''
  CREATE TABLE "applinks" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT ,
    "name" TEXT NOT NULL ,
    "host" TEXT NOT NULL UNIQUE ,
    "sshport" INTEGER NOT NULL,
    "username" TEXT NOT NULL ,
    "password" TEXT
  )
''');
    print("On Create db=======");
  }

  Future<List<Map>> selectData(
      {required String table,
      String where = "",
      String customfields = "*"}) async {
    Query query = Query(table: table, where: where, customfields: customfields);
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(query.select());
    // print(response);
    return Future.value(response);
  }

  Future<int> insertData(
      {required String table, required List<Map<String, dynamic>> data}) async {
    Query query = Query(table: table);
    Database? mydb = await db;
    int response = await mydb!.rawInsert(query.insert(values: data));
    // print(response);
    return Future.value(response);
  }

  Future<int> insertDataqq(String qq) async {
    // Query query = Query(table: table);
    Database? mydb = await db;
    int response = await mydb!.rawInsert(qq);
    // print(response);
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
    // print(response);
    return Future.value(response);
  }

  Future<int> deleteData({
    required String table,
    String where = "",
  }) async {
    Query query = Query(table: table, where: where);
    Database? mydb = await db;
    int response = await mydb!.rawDelete(query.delete());
    // print(response);
    return Future.value(response);
  }
}
