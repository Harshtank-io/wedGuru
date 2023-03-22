import 'package:flutter/material.dart';
import 'package:wed_guru/database/dbhelper.dart';
import 'package:wed_guru/model/pmodel.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.user}) : super(key: key);
  final User user;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(user.name),
        centerTitle: true,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user.name}'),
            Text('Gender: ${user.gender}'),
            Text('City: ${user.city}'),
            Text('Description: ${user.description}'),
          ],
        ),
      ),
    );
  }
}


