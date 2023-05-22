class Task{
   int? id;
   String? title;
   String? note;
   int? iscompleted;
   String? date;
   String? startTime;
   String? endTime;
   int? color;
   int? reminder;
   String ?repeat;
   


   Task({
    this.id,
    this.title,
    this.note,
    this.iscompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.reminder,
    this.repeat
    
   });




//  static Task fromjson(Map<String, dynamic>json)=>Task(  
//     id :json['id'],
//   title :json['title'],
//   note :json['note'],
//   iscompleted :json['iscompleted'],
//   date :json['date'],
//   startTime :json['startTime'],
//   endTime :json['endTime'],
//   color :json['color'],
//   reminder :json['reminder'],
//   repeat :json['repeat'],);
  




// Map<String,dynamic> tojson()=>{
// 'id':id,
// 'title':title,
// 'data' :date,
// 'note' :note,
// 'iscompleted' :iscompleted,
// 'startTime' :startTime,
// 'endTime' : endTime,
// 'color' :color,
// 'reminder' : reminder,
// 'repeat' :repeat,
// };
 }
