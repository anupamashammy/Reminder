
// import 'dart:developer';

// import 'package:get/get.dart';
// import 'package:reminder_application8078/db/db_helper.dart';

// import '../models/task.dart';



// class TaskController extends GetxController {
//   // final taskList = <Task>[].obs;


//   @override
//   void onReady() {
//     getTasks();
//     super.onReady();
//   }

//  var taskList = <Task>[].obs;

//   Future<int> addTask({Task? task}) async {
//     return await DBHelper.insert(task);
//   }

//   void getTasks() async{
//     List<Map<String, dynamic>> tasks = await DBHelper.query();
//     taskList.assignAll(tasks.map((data) => Task.fromjson(data)).toList());
//   }

//   void delete(Task task){
//    DBHelper.delete(task);
  
//   }
// }
