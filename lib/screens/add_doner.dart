

import 'package:flutter/material.dart';


class AddDonerBloodDonation extends StatefulWidget {
  const AddDonerBloodDonation({super.key});

  @override
  State<AddDonerBloodDonation> createState() => _AddDonerBloodDonationState();
}

class _AddDonerBloodDonationState extends State<AddDonerBloodDonation> {

  final  bloodgroups =['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  // ignore: non_constant_identifier_names
  String ?SelectedGroup;
   

  final TextEditingController _donernamecontroller =  TextEditingController();
  final TextEditingController _numbercontroller  =  TextEditingController();
  // ignore: unused_field
  final TextEditingController _selectbloodcontroller =  TextEditingController();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate blood'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [

            TextField(
                  controller: _donernamecontroller,
                  decoration: 
                  const InputDecoration(
                    border: OutlineInputBorder(),
                    label:
                     Text(
                      'Doner Name'
                      )),
                  
                 ),

              
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: TextField(
                      controller: _numbercontroller,
                      keyboardType:TextInputType.number,
                      maxLength: 10,
                      decoration: 
                      InputDecoration(
                        border: OutlineInputBorder(),
                        label:
                         Text(
                          'Number'
                          )),
                      
                     ),
                   ),
                 

                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: DropdownButtonFormField(
                    decoration: InputDecoration(label: Text("Select Blood Group")),
                    items: bloodgroups
                    .map((e) => DropdownMenuItem(
                                 child: Text(e),
                                 value: e,
                                 ))
                                 .toList(),
                                  onChanged:((value) {
                           SelectedGroup = value;
                    }) ),
                 ),

                 ElevatedButton(
                  onPressed:() {

                    


                  Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    minimumSize:MaterialStateProperty.all(Size(double.infinity,50 )) ,
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
                 child: Text('Submit',style: TextStyle(fontSize: 20),)
                 
                 
                 )
            


           
    




          ],
        ),
      ),
    );
  }

  
}