import 'package:flutter/material.dart';
import 'package:reminder_application8078/colors/colors.dart';
import 'package:reminder_application8078/screens/pill_second.dart';

class PillReminder extends StatelessWidget {
  const PillReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [

            TopContainer(),
            SizedBox(
              height: 10,
            ),
            Flexible(child: BottamContainer()),
          ],
        ),
      ),
      floatingActionButton:InkResponse(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PillSecondPages()));
        },
        child: Card(
          color:  yellowClr,
          shape: BeveledRectangleBorder(  
            borderRadius: BorderRadius.circular(3),
          ),
          child: const Icon(Icons.add,
          size: 70,
          ),
          
        ),
      ),
    ); 
  }
}
class TopContainer extends StatelessWidget {
  const TopContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Container(
          alignment: Alignment.topLeft,
           child: Padding(
             padding: const EdgeInsets.only(bottom: 1),
             child: Text(
               'Worry less .\n Live healthier',
              textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline4,
              ),
           ),
         ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              'Welcome to daily Dose',
              textAlign: TextAlign.start,
               style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                '0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
      ],
    );
  }
}
class BottamContainer extends StatelessWidget {
  const  BottamContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Medicine',
      
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}



