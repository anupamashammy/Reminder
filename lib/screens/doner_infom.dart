import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DonerInformation extends StatelessWidget {
  String name;
  String blood;
  String number;
   DonerInformation({super.key,required this.blood,required this.name,required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Container(
           child: Column(

            children: [
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border: OutlineInputBorder(),
                   labelText: name,
                    
                  ),
                 ),
               ),

                Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border: OutlineInputBorder(),
                   labelText: number,
                    
                  ),
                 ),
               ),

                Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border: OutlineInputBorder(),
                   labelText: blood,
                    
                  ),
                 ),
               ),
               
              //  Text(name),
              //  Text(blood),
              //  Text(number),
  ],
),
         ),
       ),
     ),
    );
  }
}