import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_application8078/db/db_workout.dart';
import 'package:reminder_application8078/screens/Workout_second.dart';
import 'package:reminder_application8078/screens/heat_map.dart';

class WorkoutHomePages extends StatefulWidget {
  const WorkoutHomePages({super.key});

  @override
  State<WorkoutHomePages> createState() => _WorkoutHomePagesState();
}

class _WorkoutHomePagesState extends State<WorkoutHomePages> {

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    Provider.of<WorkoutDate>(context, listen: false).initalizeWorkoutList();
  }

final newWorkoutNameController = TextEditingController();

  @override     
  Widget build(BuildContext context) {
    return Consumer<WorkoutDate>(builder: (context, value, child) => Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
      title: const Text("Workout Tracker"),
      ),   
      floatingActionButton: FloatingActionButton(
        onPressed: createNewWorkout,
        child: const Icon(Icons.add),  
        ),
      body:ListView(
        children: [
          //heat map

          MyHeatMap(datasets: value.heatMapDataSat, startDateYYYYMMDD: value.getStartDate().toString()),


          // workout list

           ListView.builder(
             shrinkWrap: true,
             physics:    NeverScrollableScrollPhysics(),
             itemCount: value.getWorkoutList().length,
             itemBuilder:(context, index) => ListTile(
             title: Text(value.getWorkoutList()[index].name),
             trailing: IconButton(
             icon:const Icon(Icons.arrow_forward_ios) ,
              onPressed:() => GoToWorkoutpage(value.getWorkoutList()[index].name),
             ),
        ) 
        ),
        ],
      )

    ),);
  }

void createNewWorkout(){
  showDialog(
    context: context, 
    builder:(context) => AlertDialog(
    title : const Text(" Create new Workout"),
    content: TextField(
      controller: newWorkoutNameController,
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
    ) );
}

void save() {
  String newWorkoutName = newWorkoutNameController.text;
  Provider.of<WorkoutDate>(context, listen: false)
      .addWorkout(newWorkoutName);

      Navigator.pop(context);
      clear();
 }


  void cancel(){
  Navigator.pop(context);
  clear();
  }


  //clear controllers

  void clear(){
    newWorkoutNameController.clear();
   
   }

   void GoToWorkoutpage(String workoutName){
   Navigator.push(context, MaterialPageRoute(
    builder: (context) => WorkoutSecondPage(workoutName: workoutName)
   //` workoutSecondPage(workoutName: 'WorkoutName',),
    ));


   }



}    