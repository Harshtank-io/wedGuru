import 'package:flutter/material.dart';

class NewName extends StatefulWidget {
  const NewName({Key? key}) : super(key: key);

  @override
  State<NewName> createState() => _NewNameState();
}

class _NewNameState extends State<NewName> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 50,left: 50,right: 50),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: const TextField(
          style: TextStyle(
            color: Colors.white70,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Name',
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
