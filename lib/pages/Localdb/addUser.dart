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
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          title: Text("Add"),
          leading: Icon(Icons.chevron_left),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25)
              )
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
                TextFormField(
                  controller: _genderController,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                // City text field
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
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
                          gender: _genderController.text,
                          city: _cityController.text,
                          description: _descriptionController.text,
                        );
                        await dbHelper.insert(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('User Added Successfully!!'),
                            duration: Duration(seconds: 2),
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
                      Navigator.push(
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

  Future<void> _getUsers() async {}
}

//fields for user add
/*
name,gender,dob,religion,caste,location/address,about me,hobbies,photo,height,
marital status.
db table :-
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gender VARCHAR(10),
    name VARCHAR(255),
    date_of_birth DATE,
    marital_status VARCHAR(20),
    religion VARCHAR(50),
    caste VARCHAR(50),
    education_level VARCHAR(50),
    occupation VARCHAR(50),
    annual_income INT,
    height INT,
    weight INT,
    location_address VARCHAR(255),
    about_me TEXT,
    hobbies_interests TEXT,
    photos TEXT,
);
*/
