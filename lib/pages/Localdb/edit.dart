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
  late String _city;
  late String _description;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _city = widget.user.city;
    _gender = widget.user.gender;
    _description = widget.user.description;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
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
              TextFormField(
                initialValue: _city,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
                onSaved: (value) => _city = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _gender,
                decoration: InputDecoration(labelText: 'gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter gender';
                  }
                  return null;
                },
                onSaved: (value) => _gender = value!,
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
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Update'),
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
    final updatedUser = widget.user.copyWith(name: _name, city: _city , gender:_gender , description :_description );
    DatabaseProvider.db.update(updatedUser);
  }
}
