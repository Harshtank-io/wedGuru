import 'package:flutter/material.dart';

class PersonDetail extends StatefulWidget {
  const PersonDetail({Key? key}) : super(key: key);

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Text('hello',style: TextStyle(
          color: Colors.black
        ),),
      ),
    );
  }
}
