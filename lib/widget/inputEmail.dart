import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({Key? key}) : super(key: key);

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.only(top: 50, left: 50, right: 50),
      child:  SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child:  TextFormField(
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
