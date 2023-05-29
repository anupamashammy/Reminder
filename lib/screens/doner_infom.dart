import 'package:flutter/material.dart';



class DonerInformation extends StatelessWidget {
  String name;
  String blood;
  String number;
   DonerInformation({super.key,required this.blood,required this.name,required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Info'),
        ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: SizedBox(
           child: Column(

            children: [
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border:const OutlineInputBorder(),
                   labelText: name,
                    
                  ),
                 ),
               ),

                Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border:const OutlineInputBorder(),
                   labelText: number,
                    
                  ),
                 ),
               ),

                Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                  //textAlign: TextAlign.center,
                  decoration: InputDecoration(

                   border: const OutlineInputBorder(),
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