import 'package:flutter/widgets.dart';
import 'package:reminder_application8078/db/workout_database.dart';
import 'package:reminder_application8078/models/exercise.dart';
import 'package:reminder_application8078/models/workouts.dart';
import 'package:reminder_application8078/widgets/Work_DateTime.dart';

class WorkoutDate extends ChangeNotifier{

  final db = HiveDatabase();

  List<Workout> workoutList =[
    Workout(
      name:"Upper Body" ,
       exercise:[
        Exercise(
          name:"Bicep Curls" ,
           weight:"10" , 
           reps:"10" , 
           sets:"3" ,
           ),
       ],
     ),

     
    Workout(
      name:"lower Body" ,
       exercise:[
        Exercise(
          name:"squants" ,
           weight:"10" , 
           reps:"10" , 
           sets:"3" 
           )                                                                                                                           
       ]
     )

  ];
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
   void initalizeWorkoutList(){
    if(db.previousDataExists()){
      workoutList = db.readFromDatabase();
    }else{
      db.saveToDatabase(workoutList);
    }
    loadHeatMap();
   }


  // get the list of workouts
 List<Workout> getWorkoutList(){
  return workoutList;
 }

  // get length of a given workout
int numberofExercisesInWorkout(String workoutName){
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  return relevantWorkout.exercise.length;
}

  // add a workout

void addWorkout(String name){
  workoutList.add(Workout(name: name, exercise: []));
  notifyListeners();

  db.saveToDatabase(workoutList);
}

  // add an exercise to a workout

void addExercise(String workoutName , String exerciseName , String weight ,String reps , String sets ){
 
Workout relevantWorkout = getRelevantWorkout(workoutName);

  relevantWorkout.exercise.add(
    Exercise(
      name: exerciseName,
       weight: weight,
        reps: reps,
         sets: sets,
         ));
  notifyListeners();

  db.saveToDatabase(workoutList);
}


  //check off exercise
void checkOffExercise(String workoutName , String exerciseName){
Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
relevantExercise.isCompleted = !relevantExercise.isCompleted;

notifyListeners();

db.saveToDatabase(workoutList);

loadHeatMap();
}


  Workout getRelevantWorkout (String workoutName){
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      Workout relevantWorkout = workoutList.firstWhere((Workout) =>Workout.name == workoutName);
      return relevantWorkout;

  }
  Exercise getRelevantExercise(String workoutName , String exerciseName){
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercise.firstWhere((exercise) => exercise.name==exerciseName);
    return relevantExercise;
  }

  String getStartDate(){
    return db.getStartData();
  }


    Map<DateTime, int> heatMapDataSat ={};

  void loadHeatMap(){
    DateTime startDate = createDateTimeObject(getStartDate());

    int dayInBetween = DateTime.now().difference(startDate).inDays;

    for(int i = 0; i<dayInBetween + 1; i++){
        String yyyymmdd = ConvertDateTimeToYYYYMMDD(startDate.add(Duration(days: i)));

        // ignore: non_constant_identifier_names
        int CompletedStatus = db.getCompletionStatus(yyyymmdd);

        // year 
        int year  =startDate.add(Duration(days: i)).year;

        //Month
        int month  =startDate.add(Duration(days: i)).month;

        //Day 

        int day  =startDate.add(Duration(days: i)).day;


        final percentForEachdays =  <DateTime, int>{
          DateTime(year,month,day):  CompletedStatus
        };

     heatMapDataSat.addEntries(percentForEachdays.entries);
    }
  }

}


