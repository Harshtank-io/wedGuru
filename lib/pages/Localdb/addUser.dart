import 'package:flutter/material.dart';
import 'package:wed_guru/database/databasehelper.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';


class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _nameController = TextEditingController();
//  final TextEditingController _genderController = TextEditingController();
//  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  String _genderValue = '';

  String? cityDropDownValue;
  final List<String> cityOption = <String>[
    'Jamnagar',
    'Rajkot',
    'Vadodara',
    'Ahmedabad'
  ];

  final dbHelper = DatabaseProvider.db;

  // List<User> userlist = [];
  // DatabaseProvider db = DatabaseProvider.db;

  @override
  // void initState(){
  //   super.initState();
  //   _getUsers();
  // }

  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25)
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => UserList()));
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name text field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Gender text field
                // TextFormField(
                //   controller: _genderController,
                //   decoration: const InputDecoration(
                //     labelText: 'Gender',
                //     border: OutlineInputBorder(),
                //   ),
                // ),

                // Gender Radio
                const Text(
                  'gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Male'),
                        value: 'Male',
                        groupValue: _genderValue,
                        onChanged: (value) {
                          setState(() {
                            _genderValue = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Female'),
                        value: 'Female',
                        groupValue: _genderValue,
                        onChanged: (value) {
                          setState(() {
                            _genderValue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: cityDropDownValue,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  items: cityOption.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value));
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      cityDropDownValue = newvalue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please selected a city';
                    }
                    return null;
                  },
                ),

                // // City text field
                // TextFormField(
                //   controller: _cityController,
                //   decoration: const InputDecoration(
                //     labelText: 'City',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                const SizedBox(height: 16.0),
                // Description text field
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Save/Add button
                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final user = User(
                          name: _nameController.text,
                          gender: _genderValue,
                          city: cityDropDownValue!,
                          description: _descriptionController.text,
                        );
                        await dbHelper.insert(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('User Added Successfully!!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        // Navigator.pop(context);
                      }
                    },
                    backgroundColor: Colors.pink,
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                ),
                const SizedBox(height: 16),
                // Save/Add button
                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserList(),
                        ),
                      );
                    },
                    backgroundColor: Colors.pink,
                    icon: const Icon(Icons.add),
                    label: const Text('User'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}