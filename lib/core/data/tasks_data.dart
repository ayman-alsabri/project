

// import '../database/sqldb.dart';

// class TasksData {
//   SqlDb sqlDb = SqlDb();

//   Future<int> saveTask({required CustomLink customLink}) async {
//     int response =
//         await sqlDb.insertData(table: "applinks", data: [customLink.toJson()]);

//     return Future.value(response);
//   }

//   Future<List<Map<dynamic, dynamic>>> getTasks() async {
//     List<Map<dynamic, dynamic>> response =
//         await sqlDb.selectData(table: "applinks");

//     return Future.value(response);
//   }

//   Future<int> updateTask({required CustomLink customLink}) async {
//     int response = await sqlDb.updateData(
//         table: "applinks", data: customLink.toJson(), where: "");

//     return Future.value(response);
//   }

//   Future<int> deleteLink({required CustomLink customLink}) async {
//     int response = await sqlDb.deleteData(
//         table: "applinks", where: "WHERE id=${customLink.id}");

//     return Future.value(response);
//   }
// }
