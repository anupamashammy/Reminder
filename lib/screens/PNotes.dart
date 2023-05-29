import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:reminder_application8078/widgets/theme.dart';

import '../colors/colors.dart';
import '../widgets/PNotes.dart';

class NotePadNotes extends StatefulWidget {
  const NotePadNotes({super.key});

  @override
  State<NotePadNotes> createState() => _NotePadNotesState();
}

class _NotePadNotesState extends State<NotePadNotes> {
    DateTime _dateTime=DateTime.now();

    String keyword = '';
    List<Map<String, dynamic>> searchResults = [];
    DateTime _selectedDate = DateTime.now();
    List<Map<String, dynamic>> searchItems(String keyword) {
    List<Map<String, dynamic>> results = [];
     
   for( var item in _noteitems){
    
    var title =item['Title'];
    var notes =item['Notes '];
   

    if(title.toString().toLowerCase().contains(keyword.toLowerCase()) || 
       notes.toString().toLowerCase().contains(keyword.toLowerCase())){
       results.add(item);
    }
   }
   log(results.toString());
      return results;
      

    }
     void performSearch(String input) {
    setState(() {
      keyword = input;
      searchResults = searchItems(keyword);
    });
  }

  final TextEditingController _titlecontroller =  TextEditingController();
  final TextEditingController _descreptioncontroller  =  TextEditingController();
   TextEditingController dateTimecontroller = TextEditingController();


  List<Map<String,dynamic>> _noteitems = [];

  // ignore: non_constant_identifier_names
  final _note_box = Hive.box('_note_box');
  
  @override
  void initState() {
    super.initState();
    _refreshNOteItem();
  }

  void _refreshNOteItem(){
    final data =_note_box.keys.map((key) {
      final item = _note_box.get(key);
      return {
      "key" : key,
      "Title":item["Title"],
      "Notes":item["Notes"],
      "Date" :item["Date"],
      };
     
    }).toList();
log(_note_box.toString());
    setState(() {
      _noteitems =data.reversed.toList();
     // ignore: avoid_print
     print(_noteitems.length);
    });
  }

 Future<void>  _createNote(Map<String, dynamic> newItem) async {
  await _note_box.add(newItem);
  log(newItem.toString());
  _refreshNOteItem();
}

Future<void>  _updateNote( int itemKey ,Map<String, dynamic> newItem) async {
  await _note_box.put(itemKey, newItem);
  _refreshNOteItem();
}

Future<void>  _deleteNote( int itemKey ) async {
  await _note_box.delete(itemKey);
  _refreshNOteItem();
}

showalertdiloagbox(int key){
  
    showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure to delete the data'),
      // content: const Text('Alert message'),
      actions: <Widget>[
        TextButton(
          child: const Text('NO'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('YES'),
          onPressed: (){ 
            _deleteNote(key);
            Navigator.of(context).pop();
          }
          ),
      ],
    );
  },
  
);
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Notes'),
        centerTitle:true ,
        backgroundColor: AppStyle.mainColor,
        
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Text(' ${_dateTime.day}: ${_dateTime.month}:${_dateTime.year}'),
              const SizedBox(
                  height: 20,
            ),
            TextField(
              onChanged: (val){
                setState(() {
                  searchResults =searchItems(val);
                });
              
              },
                decoration: InputDecoration(
                  labelText: 'Search',
                   hintStyle: const TextStyle(color: Color.fromARGB(255, 19, 19, 18)),
                  fillColor: const Color.fromARGB(255, 16, 17, 16),
                  
                 suffixIcon: 
                 const Icon(Icons.search),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)

                 )
                    )  
                  ),
                  
                 const SizedBox(
                  height: 20,
                 ),


             Row(
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
                ],
                
              ),
              ]
             ),


             Expanded(

              child:
                   searchResults.isEmpty ?

               ListView.builder(
                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //         maxCrossAxisExtent: 200,nhjmhmjjm
                //         childAspectRatio: 3 / 2,
                //         crossAxisSpacing: 20,
                //         mainAxisSpacing: 20),
               itemCount: _noteitems.length,
               itemBuilder: (ctx, index) {
               final currentItem = _noteitems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: const Color.fromARGB(255, 244, 249, 244),
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                  title: Text(currentItem["Title"].toString()),
                  subtitle: Text(currentItem["Notes"].toString()),
                  trailing: Row(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(currentItem["Date"].toString()),
                    IconButton(
                      onPressed: ()=> _showForm(context, currentItem['key'])  ,
                       icon: const Icon(Icons.edit)
                       ),
                    IconButton(
                      onPressed: ()=> showalertdiloagbox(currentItem['key']) ,
                       icon:const Icon(Icons.delete)
                       ),
                    ],
                     ),
                     ),
                    ),
                );
                },
                ):ListView.builder(
               itemCount: searchResults.length,
               itemBuilder: (ctx, index) {
              // final currentItem = _items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  color: const Color.fromARGB(255, 247, 244, 244),
                  elevation: 5,
                  child: ListTile(
                  title: Text(searchResults[index]['Title']),
                  subtitle: Text(searchResults[index]['Notes']),
                  trailing: 
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     // Text(searchResults[index]["Select Blood Group"]),
                     IconButton(
                      onPressed: (() => _showForm(context, index)),
                       icon: const Icon(Icons.edit),
                       ),
                    ]
                     ),
                   )
                  ),
                );
               },
             ),
            )
          ],
        ),
      ),
        floatingActionButton:  FloatingActionButton(
                onPressed: () =>_showForm(context,null ),
                child: const Icon(Icons.add),
                ),
      );
  }
  void _showForm(BuildContext context, int? itemKey)async{

  if(itemKey !=null){
    final existingnote = _noteitems.firstWhere((element) => element['key'] ==itemKey);
    _titlecontroller.text = existingnote['Title'];
    _descreptioncontroller.text = existingnote['Notes'];
     dateTimecontroller.text = existingnote['Data'];
}
  showModalBottomSheet(
    
    context: context, 
    elevation: 5,
    isScrollControlled: true,
    builder: (_)=>Container(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      top: 15,
      left: 15,
      right: 15,

    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MyInputField(
          //controller: dateTimecontroller,
          title: "Date",
              hint: DateFormat.yMd().format(_selectedDate),),
               IconButton(icon:const Icon(Icons.calendar_today_outlined, color:darkGreyClr),
                onPressed:(){
                  setState(() {
                    _getDatefromUser();
                   
                  });
                    log('hi there');
                   
                }),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: 
           TextField(

            controller: _titlecontroller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',

            
              )
              

              
              ),
            ),   
             Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller:  _descreptioncontroller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Notes',
              )
              ),
            ),

            ElevatedButton(
              onPressed: () {
               // validation(context);
            
              if(itemKey ==null){
              _createNote({
                  "Title" :_titlecontroller.text,
                  "Notes" :_descreptioncontroller.text,
                  "Date"  :dateTimecontroller.text,
              });
              }

               if(itemKey !=null){
                _updateNote(itemKey, {
                 'Title' :_titlecontroller.text.trim(),
                 'Notes' :_descreptioncontroller.text.trim(),
                 "Date"  :dateTimecontroller.text.trim(),
                });

               }
                _titlecontroller.clear();
                _descreptioncontroller.clear();
                dateTimecontroller.clear();

                 Navigator.of(context).pop();
               },
               style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                   const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 19, 180, 205))
                ),
                child:   Text(itemKey ==null ?"Create New":"Update",
                  style:const TextStyle(
                    fontSize: 15),
                    ),
                    
                    )
      ]),
    )

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
          dateTimecontroller.text=_selectedDate.toString();
          print(_selectedDate);
          
        });
       }else{
        log("It's null or something is wrong");
       }
}


//              validation (BuildContext context){
//               if( _titlecontroller.text.isNotEmpty && _descreptioncontroller.text.isNotEmpty && dateTimecontroller.text.isNotEmpty){
                
//                 return Text( 'Please enter an email address.');

//                }else if(_titlecontroller == _titlecontroller && _descreptioncontroller == _descreptioncontroller){
                    
                    
//                     showDialog(context: context, builder: (ctx1){
//                       return AlertDialog(title: Text("Error"),
//                       content:Text(" This field already exists") ,
//                       actions: [
//                         TextButton(onPressed:() {
//                         Navigator.of(ctx1).pop();
//                         }, child: Text("close"))
//                       ],
//                       );
                            
//                     });

//                }else{
//                 return;
                 
//                }
// }
}


               

