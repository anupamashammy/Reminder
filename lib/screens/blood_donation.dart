import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_application8078/screens/add_blood.dart';
import 'package:reminder_application8078/screens/doner_infom.dart';

class BloodDonation extends StatefulWidget {
  const BloodDonation({super.key});

  @override
  State<BloodDonation> createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {

  
   String keyword = '';
    List<Map<String, dynamic>> searchResults = [];

    List<Map<String, dynamic>> searchItems(String keyword) {
    List<Map<String, dynamic>> results = [];
    

     for( var item in _items){
    
    var donerName =item['DonerName'];
    var number =item['Number '];
    var selectBloodGroup =item['SelectBloodGroup '];

   

    if(donerName.toString().toLowerCase().contains(keyword.toLowerCase()) || 
       number.toString().toLowerCase().contains(keyword.toLowerCase()) ||
       selectBloodGroup.toString().toLowerCase().contains(keyword.toLowerCase())){
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

  List<Map<String,dynamic>> _items = [];

    
    final _bloodbox  = Hive.box('_bloodbox');

   @override
  void initState() {
    super.initState();
    _refreshNOteItem();
  }

void _refreshNOteItem(){
    final data =_bloodbox.keys.map((key) {
      final item = _bloodbox.get(key);
      return {
      "key" : key,
      "Doner Name":item["Doner Name"],
      "Phone Number":item["Phone Number"],
      "Select Blood Group":item["Select Blood Group"],
      };
    }).toList();

    setState(() {
      _items =data.reversed.toList();
     print(_items);
    });
  }

 Future<void>  _createdoner(Map<String, dynamic> newItem) async {
  await _bloodbox.add(newItem);
  _refreshNOteItem();
}

Future<void>  _updatedoner( int itemKey ,Map<String, dynamic> newItem) async {
  await _bloodbox.put(itemKey, newItem);
  _refreshNOteItem();
}

Future<void>  _deletedoner( int itemKey ) async {
  await _bloodbox.delete(itemKey);
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
            _deletedoner(key);
            Navigator.of(context).pop();
          }
          ),
      ],
    );
  },
  
);
 } 


  final TextEditingController _namecontroller =  TextEditingController();
  final TextEditingController _numbercontroller  =  TextEditingController();
  final TextEditingController _bloodgroupcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
   
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood pppppppppppp"),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                 Expanded(

              child:
                   searchResults.isEmpty ?

               ListView.builder(
                
              
               itemCount: _items.length,
               itemBuilder: (ctx, index) {
               final currentItem = _items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DonerInformation(name: currentItem['Doner Name'],blood: currentItem['Select Blood Group'],number: currentItem['Phone Number'],))),
                    child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: const Color.fromARGB(255, 244, 249, 244),
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                    title: Text(currentItem["Doner Name"].toString()),
                    subtitle: Text(currentItem["Phone Number"].toString()),
                    trailing:
                     Row(
                      
                    mainAxisSize: MainAxisSize.min,
                    children: [
                         Text(currentItem["Select Blood Group"].toString()),
                      IconButton(
                        onPressed: (() => _showForm(context:  context,itemKey: currentItem['key'])),
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
                  ),
                );
                },
                ):ListView.builder(
               itemCount: searchResults.length,
               itemBuilder: (ctx, index) {
              //final currentItem = _items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  color: const Color.fromARGB(255, 247, 244, 244),
                  elevation: 5,
                  child: ListTile(
                  title: Text(searchResults[index]['Doner Name']),
                  subtitle: Text(searchResults[index]['Phone Number']),
                  trailing: 
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Text(searchResults[index]["Select Blood Group"]),
                     IconButton(
                      onPressed: (() => _showForm(context: context, itemKey: index)),
                       icon: const Icon(Icons.edit),
                       ),
                    ]
                     ),
                   )
                  ),
                );
               },
             ),
            ),
                  

               ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddBloodSection(),));
        } ,
        backgroundColor: Colors.red,
        child: Icon(Icons.add,
        size: 50,
        ),


        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  
   void _showForm({required  BuildContext context, required final itemKey})async{

 if(itemKey!=null){
    final existingnote = _items.firstWhere((element) => element['key'] ==itemKey);
 
 _namecontroller.text = existingnote['Doner Name'];
    _bloodgroupcontroller.text = existingnote['Select Blood Group'];
    _numbercontroller.text=existingnote['Phone Number'];
 }
 await showModalBottomSheet(
    
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
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller: _namecontroller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Neme',
              )
              ),
            ),   
             Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller:  _bloodgroupcontroller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Blood',
              )
              ),
            ),
             Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
            controller:  _numbercontroller,
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Number',
              )
              ),
            ),

            ElevatedButton(onPressed: () {
              
              
                _updatedoner(itemKey, {
                 'Doner Name' :_namecontroller.text.trim(),
                 'Select Blood Group' :_bloodgroupcontroller.text.trim(),
                 'Phone Number':_numbercontroller.text.trim()
                });

               
                _namecontroller.clear();
                _bloodgroupcontroller.clear();

                 Navigator.of(context).pop();
               },
               style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                   const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                child:   Text("Update",
                  style:const TextStyle(
                    fontSize: 15),
                    ),
                    
                    )
      ]),
    )

    );
}
}