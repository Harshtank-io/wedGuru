import 'package:flutter/material.dart';
import 'package:wed_guru/database/dbhelper.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/detail.dart';
import 'package:wed_guru/pages/edit.dart';
import 'package:wed_guru/pages/home.dart';
import 'package:wed_guru/pages/view.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final dbHelper = DatabaseProvider.db;
  List<User> userList = [];

  // int? get id  => null;

  @override
  void initState() {
    super.initState();
    _getUsers();
    // _deleteUser(id!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List Page'),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
               onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage()));},
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.city),
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>EditUser(user: user,)));},
            ),
            trailing:
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteUser(user.id!);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserList()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Deleted Successfully!!'),
                      ),
                    );
                  },
                ),
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Details(user: user,)));},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //navigate to add person page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddUser(),
            ),
          ).then((value) => _getUsers());
        },
      ),
    );
  }

  Future<void> _getUsers() async {
    final list = await dbHelper.getAllUsers();
    setState(() {
      userList = list;
    });
  }

  Future<void> _deleteUser(int id) async {
    final count = await dbHelper.delete(id);
    if (count > 0) {
      _deleteUser(id);
    }
  }
}
