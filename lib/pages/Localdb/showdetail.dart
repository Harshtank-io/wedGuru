import 'package:flutter/material.dart';
import 'package:wed_guru/database/databasehelper.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.user}) : super(key: key);
  final User user;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.pink,
        title: Text(user.name),
        leading: IconButton(
            icon :Icon(Icons.chevron_left),
          onPressed: () { Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UserList()));},
        ),
        centerTitle: true,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text('Name: ${user.name}' ,),
            ),
            Container(child: Text('Gender: ${user.gender}')),
            Container(child: Text('City: ${user.city}')),
            Container(child: Text('Description: ${user.description}')),
          ],
        ),
      ),
    );
  }
}


