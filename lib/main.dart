import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:reminder_application8078/db/db_workout.dart';
import 'package:reminder_application8078/screens/splash.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await GetStorage.init();
  await Hive.openBox("Workoutexercise_db");
  var box = await Hive.openBox('mybox');
  await Hive.openBox("_bloodbox");
  await Hive.openBox("_note_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutDate(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder Application',
      home:   
      SplashScreen(),
    ),
    );
  }
}

