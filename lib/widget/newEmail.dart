import 'package:flutter/material.dart';

class NewEmail extends StatefulWidget {
  const NewEmail({Key? key}) : super(key: key);

  @override
  State<NewEmail> createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20,left: 50,right: 50),
      child:  SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: const  TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Email',
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )
          ),
        ),
      ),
    );
  }
}
