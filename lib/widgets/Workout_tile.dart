// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WorkOutTile extends StatelessWidget {

  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool iscompleted;
 void Function(bool?)?oncheckBoxChanged;
  
   WorkOutTile({
      super.key, 
      required this.exerciseName,
      required this.weight, 
      required this.reps,
      required this.sets, 
      required this.iscompleted,
      required this.oncheckBoxChanged
       });

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.yellow,
          child: ListTile(
            title: Text(
              exerciseName,
              ),
            subtitle: Row(
              children: [
                Chip(
                label: Text(
                   "${weight}kg"
                  )
                  ),
                  Chip(
                label: Text(
                   "$reps reps",
                  )
                  ),
                  Chip(
                    label: Text(
                   "$sets sets",
                  )
                  ),
                  
              ],
            ),
            trailing:Checkbox(
              value:iscompleted , 
              onChanged: (value) =>oncheckBoxChanged!(value),
              ) ,
          ),
        
        );
  }
}    