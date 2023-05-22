import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reminder_application8078/colors/colors.dart';
import 'package:reminder_application8078/widgets/theme.dart';
import '../services/theme_services.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';


class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {


  final TextEditingController _titilecontroller =TextEditingController();
  final TextEditingController _noteController =TextEditingController();
  
  DateTime _selectedDate = DateTime.now();
  String _endTime ="9.00 pm";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedReminder =5;
  List<int>reminderlist=[
    5,
    10,
    15,
    20,
  ];
   String _selectedRepeat ="None";
  List<String>repeatlist=[
    "None",
    "Daily",
    "Weekly",
    "Monthiy",
  ];
   int  _selectedcolor=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(),
        body:Container(
          padding:const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
               Text(
                "Add Task",
               style:headingStyle ,
               ),
               MyInputField(title: "Title", hint: "Enter your title here",controller: _titilecontroller,),
               MyInputField(title: "Note", hint: "Enter your Note",controller: _noteController,),
               MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate)),
               IconButton(icon:const Icon(Icons.calendar_today_outlined, color:darkGreyClr),
                onPressed:(){
                    log('hi there');
                   _getDatefromUser();
                }),
             
               Row(
                children: [
                  Expanded(child: MyInputField(
                    title:"start Date" ,
                    hint:_startTime ,
                    widget: IconButton(
                      onPressed: () {
                        _gettimeFromUser(isStartTime: true);
                      },
                      icon:const Icon(Icons.access_time_rounded),
                      color: Colors.grey,
                    ),

                  )
                  ),
                 const SizedBox(
                    width: 12,
                  ),

                  Expanded(child: MyInputField(
                    title:"End Date" ,
                    hint:_endTime ,
                    widget: IconButton(
                      onPressed: () {
                      _gettimeFromUser(isStartTime: false);

                      },
                      icon:const Icon(Icons.access_time_rounded),
                      color: Colors.grey,
                    ),
                  )
                  )
                ],
               ),
            MyInputField(title: "Remind", hint:"$_selectedReminder minutes early ",
            widget: DropdownButton(
              icon:const Icon(Icons.keyboard_arrow_down,
              color: Colors.grey,
              ),
              iconSize: 32,
              elevation: 4,
              style: subtitleStyle,
              underline: Container(height: 0,),
              onChanged: (String? value) {
                setState(() {
                  _selectedReminder=int.parse(value!);
                });
                },
              items:reminderlist.map<DropdownMenuItem<String>>((int value){
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString(),style:const TextStyle(color: Colors.grey))
                );
              }
              ).toList(), 
               

            ),
            ),


             MyInputField(title: "Repeat", hint:"$_selectedRepeat ",
            widget: DropdownButton(
              icon:const Icon(Icons.keyboard_arrow_down,
              color: Colors.grey,
              ),
              iconSize: 32,
              elevation: 4,
              style: subtitleStyle,
              underline: Container(height: 0,),
              onChanged: (String? value) {
                setState(() {
                  _selectedRepeat=value!;
                });
                },

              items:repeatlist.map<DropdownMenuItem<String>>((String ?value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value!,style:const TextStyle(color: Colors.grey),)
                );
              }
              ).toList(), 
            ),
            ),
           const SizedBox(
              height:18 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 _colorpattan(),
                GestureDetector(onTap:() =>  (){
      
    
             },child: MyButton(label:"Create Task ", onTap: () => {})
             )
              ],
            ),
            
            
            
            ]
            )
            ),
            
          ),
          
        );
   
}



_getDatefromUser() async{
  DateTime? datePickerTimeline =await showDatePicker(
    context: context,
     initialDate: DateTime.now(),
      firstDate:DateTime(2000) ,
       lastDate:DateTime(3023) ,);

       if(datePickerTimeline!=null){
        setState(() {
          _selectedDate= datePickerTimeline;
          print(_selectedDate);
          
        });
       }else{
        print("It's null or something is wrong");
       }
}


_gettimeFromUser({required bool isStartTime}) async {
 var pickertime = await _showTimepicker();
 String _formatedTime = pickertime.format(context);
 if(pickertime==null){
  print("Time canceld");

 }else if(isStartTime==true){
  setState(() {
    _startTime=_formatedTime;
  });
 }else if(isStartTime==false){ 
  setState(() {
    _endTime=_formatedTime;
  });
  

 }
}

_showTimepicker(){
    return showTimePicker(
      initialEntryMode:TimePickerEntryMode.input ,
      context: context, 
      initialTime: TimeOfDay(
        //startime:10.30am
        hour: int.parse(_startTime.split(":")[0]),
         minute:int.parse(_startTime.split(":")[1].split("")[0]), 
         )
      );


}
 
_colorpattan(){
  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("color",
                    style: titleStyle,
                    ),
                  const  SizedBox(
                      height: 8.0,
                    ),
                    Wrap(children: List.generate(
                      3,
                    // (index) => null)
                    (int index) {
                      return GestureDetector(
                        onTap: () {
                        setState(() {
                           _selectedcolor=index; 
                           log("$index");
                        });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0 ),
                       child:  CircleAvatar(
                          radius: 14,
                          backgroundColor: index==0?primaryClr:index==1?pinkClr:yellowClr,
                          child:_selectedcolor==index? const Icon(Icons.done,
                          color: Colors.white,
                          size: 16,): Container(),
                         )                     

                        ),
                      );
                      }  
                     )
                 )
               ],
         );
    }



}

