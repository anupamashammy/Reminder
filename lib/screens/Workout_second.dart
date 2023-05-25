import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_application8078/db/db_workout.dart';
import 'package:reminder_application8078/widgets/Workout_tile.dart';

class WorkoutSecondPage extends StatefulWidget {
  const WorkoutSecondPage({super.key, required this.workoutName});
  final String workoutName;

  @override
  State<WorkoutSecondPage> createState() => _WorkoutSecondPageState();
}

class _WorkoutSecondPageState extends State<WorkoutSecondPage> {

  final exerciseNameController = TextEditingController();    
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();


  @override    
  Widget build(BuildContext context) {
    return Consumer<WorkoutDate>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(title:  Text(widget.workoutName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewExercise,
        child: Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount:value.numberofExercisesInWorkout(widget.workoutName) ,
        itemBuilder: (context, index) => 
        WorkOutTile(
          exerciseName:value.getRelevantWorkout(widget.workoutName).exercise[index].name ,
           weight:value.getRelevantWorkout(widget.workoutName).exercise[index].weight ,
            reps: value.getRelevantWorkout(widget.workoutName).exercise[index].reps ,
            sets: value.getRelevantWorkout(widget.workoutName).exercise[index].sets,
            iscompleted:value.getRelevantWorkout(widget.workoutName).exercise[index].isCompleted, 
            oncheckBoxChanged:(val) => oncheckBoxChanged(widget.workoutName, value.getRelevantWorkout(widget.workoutName).exercise[index].name) ,
            )
        )
    ),);
  }

  void oncheckBoxChanged(String workoutName , String exerciseName){
    Provider.of<WorkoutDate>(context,listen: false).checkOffExercise(workoutName, exerciseName);
  }


  //create new Exercise
  void createNewExercise(){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text(" Add a new exercise"),
        content:
        SingleChildScrollView (
           child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                
                controller: exerciseNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Exercise name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                controller: weightController,
                decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                  labelText: 'Weight',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                controller:repsController,
                decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                  labelText:' Reps',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                controller: setsController,
                decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                  labelText: 'Sets',
                ),
              ),
            )
         
            //exercise name
            //weight
            //reps
            //sets
                 ]),
         ),
        actions: [
                 // save button
     MaterialButton(
      onPressed: save,
      child: const Text("Save"),
      
      ),
      // cancel button
       MaterialButton(
      onPressed: cancel,
      child: const Text("Cancel"),
      
      )
        ],
      )
      );
  }

  void save() {
  String newExerciseName = exerciseNameController.text;
  String weight = weightController.text;
  String reps = repsController.text;
  String sets = setsController.text ;

  Provider.of<WorkoutDate>(context, listen: false).addExercise(
      widget.workoutName,
      newExerciseName,
      weight, 
      reps, 
      sets,
      );
      Navigator.pop(context);
      clear();
 }


  void cancel(){
  Navigator.pop(context);
  clear();
  }


  //clear controllers

  void clear(){
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();

   }
}