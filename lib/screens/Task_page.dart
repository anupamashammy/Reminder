import 'dart:developer';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reminder_application8078/colors/colors.dart';
import 'package:reminder_application8078/screens/add_task_bar.dart';
import 'package:reminder_application8078/widgets/button.dart';
import '../services/theme_services.dart';
import '../widgets/theme.dart';


class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _HomePageState();
}
DateTime _selectedDate = DateTime.now();
var notifyHelper;

class _HomePageState extends State<TaskHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
         _addTaskBar(),
         _addDateBar(),
         const SizedBox(height: 10,), 
        
        ],
      ),
    );
  }

 



  _addDateBar(){
    return 
         Container(
          margin: const EdgeInsets.only(top: 20,left:20 ),
          child:DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryClr,
            selectedTextColor:Colors.white ,
            dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,

            ),
            ),

             dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,

            ),
            ),

             monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,

            ),
            ),
            onDateChange: (date){
             _selectedDate=date;
            },
          ) ,
         );
  }

  _addTaskBar(){
    return  Container(  
            margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
                ),
               Text("Today",
               style: headingStyle,),
                 // MyButton(label:"+  Add Task", onTap:()=>null),
                ],
                
              ),
             GestureDetector(onTap:(){Get.to(const AddTaskPage());
             log('hello');},
             child:  MyButton(label:"+  Add Task",onTap: () async {
              await Get.to(()=>  const AddTaskPage()) ;
            // _taskController.getTasks();
             }
             ),
             )
        ]
      ),
    );
  }
  _appBar (){
    return AppBar(
      elevation: 0,
      backgroundColor:context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().SwitchTheme();
        },
        child:Icon(Get.isDarkMode? Icons.surfing_outlined:Icons.nightlight_round,
        size: 20,
        color:Get.isDarkMode? Colors.white:Colors.black
        ),
      ),
      actions: const [
          Icon(Icons.person,
          size: 20,),

        // CircleAvatar  (
        //   backgroundImage: AssetImage('lib/images/assets/kisspng-computer-icons-user-profile-avatar-profile-transparent-png-5ab03f3dba6729.3105587215214999657635.jpg')
        // ),
       
       SizedBox(width: 20,)

      ],


    );
  }
}

  