import 'package:flutter/material.dart';
import 'package:reminder_application8078/screens/PNotes.dart';
import 'package:reminder_application8078/screens/To_Do.dart';
import 'package:reminder_application8078/screens/WorkOutHome.dart';
import 'package:reminder_application8078/screens/blood_donation.dart';

class AnimaTion_Page extends StatefulWidget {
  const AnimaTion_Page({super.key});

  @override
  State<AnimaTion_Page> createState() => _AnimaTion_PageState();
}

class _AnimaTion_PageState extends State<AnimaTion_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
             width: 200,
              height: 200,
            child: Image.asset(
              
              'reminder_application8078/lib/assets/images.png',
              
             fit: BoxFit.fill,
            ),
          ),

         

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(255, 35, 5, 132),
              //shadowColor: Colors.green,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("HABIT TRACKER"),
                    textColor: Colors.white,
                    leading: const Icon(Icons.today_outlined),
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ToDoHomeScreen()));
                    },
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(255, 179, 24, 13),
              //shadowColor: Colors.green,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("BlOOD DONATION"),
                    textColor: Colors.white,
                    leading: const Icon(Icons.bloodtype),
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BloodDonation(),
                      ));
                    },
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(255, 6, 204, 138),
              //shadowColor: Colors.green,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("NOTES"),
                    textColor: Colors.white,
                    leading: const Icon(Icons.notes_outlined),
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NotePadNotes()));
                    },
                  )
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: const Color.fromARGB(255, 18, 143, 174),
              //shadowColor: Colors.green,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("WORKOUT POWER"),
                    textColor: Colors.white,
                    leading: const Icon(Icons.workspaces_outline),
                    iconColor: Colors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WorkoutHomePages()));
                    },
                  )
                ],
              ),
            ),
          ),

          //      ElevatedButton(
          //          style: ButtonStyle(
          //        padding: MaterialStateProperty.all(const EdgeInsets.only(
          //           left: 150,
          //            right:150 ,
          //            top:0 ,
          //         )),
          //    foregroundColor: MaterialStateProperty.all(Colors.white),
          //    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 229, 45, 204)),
          //    textStyle: MaterialStateProperty.all(const TextStyle(
          //    fontSize: 16,
          //  )),
          //  ),
          //  onPressed: () {Navigator.of(context).push(MaterialPageRoute(
          // builder:  (context) =>const NotePadNotes() ));},
          // child: const Text(
          // "Notes"
          // )
          // ),
        ],
      ),
    ));
  }
}
