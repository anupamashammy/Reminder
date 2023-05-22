
// import 'package:sqflite/sqflite.dart';
// import '../models/task.dart';

// class DBHelper{
//   static Database ? _db;
//   static const int  _versoin = 1;
//   static const String _tableName ="taskssss";

//   static Future<void>initDb()async{
//     if(_db !=null){
//       return;
//     }

//     try{
//       String _path = await getDatabasesPath() + 'tasks.db';
//        _db = await openDatabase(
//         _path,
//        version: _versoin,
//        onCreate: (db, version) {
//          print("Creating a new one");
//          return db.execute(
//               "CREATE TABLE $_tableName("
//               "id INTEDER PRIMARY KEY AUTOTNCREMENT,"
//               "title STRING, note TEXT, date STRING," 
//               "startTime STRING, endTime STRING,"
//               "remind INTEGER, repeat STRING,"
//               "color INTEGER,"
//               "iscompleted INTEGER)",
//          );
//        },
//         );
//     }catch(e){
//       print(e);
//     }
//   }

//   static Future<int>insert(Task? task) async{
//     print("insert function called");
//     return await _db!.insert(_tableName, task!.tojson());
//   }

// static Future<List<Map<String, dynamic>>> query() async{
//    print("query function called");
//   return await _db!.query(_tableName);
//   }


//   static delete(Task task) async{
//   await  _db!.delete(_tableName, where: 'id=?',whereArgs:[task.id] );
  