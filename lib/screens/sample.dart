

// import 'dart:developer';

// import 'package:flutter/material.dart';

// class MySuperScreen extends StatefulWidget {
//   const MySuperScreen({super.key});

  

//   @override
//   State<MySuperScreen> createState() => _MySuperScreenState();
// }

// class _MySuperScreenState extends State<MySuperScreen> {

  
//   String keyword = '';
//   List<Map<String, dynamic>> searchResults = [];


  
//   List<Map<String, dynamic>> searchItems(String keyword) {
//   List<Map<String, dynamic>> results = [];

//   for (var item in items) {
//     String title = item['title'] ?? '';
//     String description = item['description'] ?? '';

//     if (title.toLowerCase().contains(keyword.toLowerCase()) ||
//         description.toLowerCase().contains(keyword.toLowerCase())) {
//       results.add(item);
//     }
//   }

//   return results;
// }

//  void performSearch(String input) {
//     setState(() {
//       keyword = input;
//       searchResults = searchItems(keyword);
//     });
//     log(searchResults.toString());
//   }

//   List<Map<String, dynamic>> items = [
//   {'title': 'Apple', 'description': 'A fruit'},
//   {'title': 'Banana', 'description': 'A fruit'},
//   {'title': 'Orange', 'description': 'A fruit'},
//   {'title': 'Mango', 'description': 'A fruit'},
//   {'title': 'Grapes', 'description': 'A fruit'},
//   {'title': 'Pineapple', 'description': 'A fruit'},
// ];

//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: performSearch,
//             decoration: const InputDecoration(
//               hintText: 'Search',
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: searchResults.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(searchResults[index]['title']),
//                   subtitle: Text(searchResults[index]['description']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';

// class Datetime extends StatelessWidget {
//    Datetime({super.key});


//   DateTime selectedDate = DateTime.now();
// TimeOfDay selectedTime = TimeOfDay.now();


//   Future<void> _selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate,
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2100),
//   );
//   if (picked != null && picked != selectedDate) {
//     setState(() {
//       selectedDate = picked;
//     });
//   }
// }

// Future<void> _selectTime(BuildContext context) async {
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: selectedTime,
//   );
//   if (picked != null && picked != selectedTime) {
//     setState(() {
//       selectedTime = picked;
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//   children: [
//     ElevatedButton(
//       onPressed: () => _selectDate(context),
//       child: Text('Select Date'),
//     ),
//     Text('Selected Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}'),
//     ElevatedButton(
//       onPressed: () => _selectTime(context),
//       child: Text('Select Time'),
//     ),
//     Text('Selected Time: ${selectedTime.format(context)}'),
//   ],
// ),
// ,
//     );
//   }
// }


 

 


