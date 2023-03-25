import 'package:wed_guru/database/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';

class EditUser extends StatefulWidget {
  final User user;

  const EditUser({Key? key, required this.user}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _gender;
  //late String _city;
  late String _description;

  String _genderValue = '';
  String? cityDropDownValue;
  final List<String> cityOption = <String>['Jamnagar' ,'Rajkot' , 'Vadodara' , 'Ahemdabada'];

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    //_city = widget.user.city;
    _gender = widget.user.gender;
    _description = widget.user.description;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Update',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              // TextFormField(
              //   initialValue: _city,
              //   decoration: InputDecoration(labelText: 'City'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter city';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) => _city = value!,
              // ),
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
                onChanged: (String? newvalue){
                  setState(() {
                    cityDropDownValue = newvalue;
                  });
                },
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'please selected a city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // TextFormField(
              //   initialValue: _gender,
              //   decoration: InputDecoration(labelText: 'gender'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter gender';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) => _gender = value!,
              // ),

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
                      onChanged: (value){
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
                      onChanged: (value){
                        setState(() {
                          _genderValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: StadiumBorder(),

                  ),
                  onPressed: _submitForm,
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _updateUser();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>UserList()));
    }
  }

  void _updateUser() {
    final updatedUser = widget.user.copyWith(name: _name, city: cityDropDownValue  , gender:_genderValue , description :_description );
    DatabaseProvider.db.update(updatedUser);
  }
}
