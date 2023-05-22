
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class AddBloodSection extends StatefulWidget {
  const AddBloodSection({super.key});

  @override
  State<AddBloodSection> createState() => _AddBloodSectionState();
}

class _AddBloodSectionState extends State<AddBloodSection> {

  final bloodGroup =['A+','A-','B+','B-','O+','O-','AB+','AB-'];
  String ? selectedGroup;

  final TextEditingController _namecontroller =  TextEditingController();
  final TextEditingController _numbercontroller  =  TextEditingController();
  final TextEditingController _bloodgroupcontroller= TextEditingController();


  List<Map<String,dynamic>> _items = [];

  final _bloodbox = Hive.box('_bloodbox');

  @override
  void initState() {
    super.initState();
    _refreshItem();
  }

  void _refreshItem(){
    final data = _bloodbox.keys.map((key) {
   final item = _bloodbox.get(key);
   return {
    "key":key,
    "Doner Name":item["Doner Name"],
    "Phone Number":item["Phone Number"],
    "Select Blood Group":item["Select Blood Group"],
   };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> _submitItem(Map<String, dynamic> newItem) async {
  await _bloodbox.add(newItem);
  _refreshItem();
}
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Donate Blood') ,
        backgroundColor: Colors.red,
      ),

      body: Expanded(
          
          
        child:
         Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
              controller: _namecontroller,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Donor Name',
                )
                ),
              ),
      
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              controller: _numbercontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
                 )
                 ),
                 ),
      
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: DropdownButtonFormField(
                    
                    decoration: const InputDecoration(
                      labelText: "Select Blood Group",
                    ),
                   value: selectedGroup,
                   items: bloodGroup
                   .map((e) =>DropdownMenuItem(
                    child:Text(e),
                    value: e,
                    ))
                   .toList(), onChanged: (val){
                    selectedGroup = val;
                    _bloodgroupcontroller.text =selectedGroup!;
                    }
                    ),
                 ),
      
                 ElevatedButton(onPressed: () async{
                 await  _submitItem({
                    "Doner Name" :_namecontroller.text,
                    "Phone Number":_numbercontroller.text,
                    "Select Blood Group" :_bloodgroupcontroller.text
                   });
                   Navigator.pop(context);
                 },
                 style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                     const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child:  const Text(
                    "Submit",
                    style:TextStyle(
                      fontSize: 20),
                      )
                      )
            ],
          ),
        ),
      ),

    
    );
  }
}