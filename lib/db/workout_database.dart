import 'dart:developer';
import 'package:hive_flutter/adapters.dart';
import 'package:reminder_application8078/models/exercise.dart';
import 'package:reminder_application8078/models/workouts.dart';
import 'package:reminder_application8078/widgets/Work_DateTime.dart';

class HiveDatabase{

  final _myBox123 =Hive.box("Workoutexercise_db");

  bool previousDataExists(){
    if(_myBox123.isEmpty){
   log("previos data does not exist");
   _myBox123.put("START_DATE", todaysDateYYYYMMDD());
     return false;
    }else{
      log("previous data does exist");
      return true;
    }
  }


   getStartData(){
    return _myBox123.get("START_DATE");
  }


void saveToDatabase(List<Workout>workouts){
  final workoutList = convertObjectToWorkoutList(workouts);
  final exerciseList = convertObjectToExerciseList(workouts);


  if(exerciseCompleted(workouts)){
    _myBox123.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 1);

  }else{
     _myBox123.put("COMPLETION_STATUS_${todaysDateYYYYMMDD()}", 0);

  }   


_myBox123.put("WORKOUTA", workoutList);
_myBox123.put("EXERCISES", exerciseList);
}

List<Workout>readFromDatabase(){
List<Workout>mySaveWorkouts =[];

List<String>workoutName = _myBox123.get("WORKOUTA");
final exerciseDetails = _myBox123.get("EXERCISES");

for(int i=0;i<workoutName.length;i++){
  List<Exercise>exerciseInEachWorkout =[];

  for(int j=0; j<exerciseDetails[i].length;j++){
    exerciseInEachWorkout.add(
      Exercise(
        name:exerciseDetails[i][j][0] ,
         weight: exerciseDetails[i][j][1], 
         reps:exerciseDetails[i][j][2] ,
          sets:exerciseDetails [i][j][3],
          isCompleted: exerciseDetails[i][j][4]== true ? true:false,
          )
    );
  }
  Workout workout = 
  Workout(
    name:workoutName[i] ,
     exercise: exerciseInEachWorkout);
     mySaveWorkouts.add(workout);
}
return mySaveWorkouts;
}

bool exerciseCompleted(List<Workout>workouts){
  for(var Workout in workouts){
    for(var exercise in Workout.exercise){
     if(exercise.isCompleted){
       return true;
     }
    }
  }
  return false;
}


int getCompletionStatus(String yyyymmdd){
  int CompletionStatus  =_myBox123.get("COMPLETION_STATUS_$yyyymmdd") ??0;
  return CompletionStatus;
}
}





  List<String> convertObjectToWorkoutList(List<Workout>Workouts){
    List<String>workoutList =[


    ] ;

    for(int i=0; i<Workouts.length;i++){
    workoutList.add(
      Workouts[i].name,
    );
    }
    return workoutList;
  

  }

List<List<List<String>>>convertObjectToExerciseList(List<Workout>workouts){
List<List<List<String>>>exerciseList =[


];
 for(int i=0; i<workouts.length;i++){
  List<Exercise>exerciseInWorkout = workouts[i].exercise;

  List<List<String>> individualWorkout = [

  ];

  for(int j=0; j<exerciseInWorkout.length;j++){
    List<String> individualExercise =[


    ];

    individualExercise.addAll(
    [
      exerciseInWorkout[j].name,
      exerciseInWorkout[j].weight,
      exerciseInWorkout[j].reps,
      exerciseInWorkout[j].sets,
      exerciseInWorkout[j].isCompleted.toString(),
    ],
    );
    individualWorkout.add(individualExercise);
  }
  exerciseList.add(individualWorkout);

 }
 return exerciseList;
}

