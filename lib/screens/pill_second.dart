
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class PillSecondPages extends StatefulWidget {
//   const PillSecondPages({super.key});

//   @override
//   State<PillSecondPages> createState() => _PillSecondPagesState();
// }

// class _PillSecondPagesState extends State<PillSecondPages> {

// final TextEditingController _medicinecontroller =  TextEditingController();
// final TextEditingController _dosagecontroller  =  TextEditingController();

// late GlobalKey<ScaffoldState> _scaffoldKey;

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _scaffoldKey = GlobalKey<ScaffoldState>();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Add New'),
//       ),
   
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:   [
//            Firsttitle(
//             title: 'Medicine Name',
//             isRequired: true,
//             ),

//             TextFormField(
//               controller: _medicinecontroller,
//               textCapitalization: TextCapitalization.words,
//               maxLength: 12,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder()
//               ),
//               style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                 color:Color.fromARGB(255, 33, 198, 243)
//               ),
//             ),

            
//           Firsttitle(
//             title: 'Dosage in mg',
//             isRequired: false,
//             ),

//             TextFormField(
//               controller: _dosagecontroller,
//               keyboardType: TextInputType.number,
//               textCapitalization: TextCapitalization.words,
//               maxLength: 12,
//               decoration: InputDecoration(
//                 border: UnderlineInputBorder()
//               ),
//               style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                 color:Color.fromARGB(255, 33, 198, 243)
//               ),
//             ),
//             SizedBox(height: 5,),
//             Firsttitle(title: 'Medicine Type', isRequired: false),

//             Row(
//               children: [
//                 MedicineType(),
//               ],
//             )
                
//           ],
//         ),
//       ),

      
       
//     );
//   }
// }


// class MedicineType extends StatelessWidget {
//   const MedicineType({super.key});

//   // final String name;
//   // final String iconValue;
//   // final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height:80 ,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Color.fromARGB(255, 7, 181, 220),
                
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top:3 ,bottom:3 ),
//                           child: SvgPicture.asset('reminder_application8078/lib/assets/Icons/pills.png',
//                           fit: BoxFit.fill,
//                           color: Colors.white,
//                           ),
//                         ),
//                       ),
                      
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width:20 ,
//                         height: 4,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 7, 181, 220),
//                           borderRadius: BorderRadius.circular(30)
//                         ),
//                         child: Center(child: Text('Pill',
//                         style: Theme.of(context).textTheme.subtitle2,)
//                         ),
//                       ),
//                     )
                    
//                   ],
//                 );

//   }
// }

// class Firsttitle extends StatelessWidget {
//   const Firsttitle({super.key, required this.title, required this.isRequired});

// final String title;
// final bool isRequired;

//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Text.rich(
//               TextSpan(
//                 children: <TextSpan> [
//                    TextSpan(
//                     text: title,
//                     style: Theme.of(context).textTheme.labelMedium,
//                    ),
//                    TextSpan(
//                     text:   isRequired  ?"*"  :"",
//                     style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.redAccent)
//                    )
//                 ]
//               )
//             ),
//     );
//   }
// }