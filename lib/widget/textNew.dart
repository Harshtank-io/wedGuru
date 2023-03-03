import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextNew extends StatefulWidget {
  @override
  _TextNewState createState() => _TextNewState();
}

class _TextNewState extends State<TextNew> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
             Center(
              child: Text(
                'Find Your Half Life Here !',
                style: GoogleFonts.poppins(
                  fontSize: 33,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}