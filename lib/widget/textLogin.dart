import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLogin extends StatefulWidget {
  @override
  _TextLoginState createState() => _TextLoginState();
}

class _TextLoginState extends State<TextLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: SizedBox(
        //color: Colors.green,
        height: 200,
        width: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
            ),
             Center(
              child: Text(
                'Wed Guru is there for you',
                style: GoogleFonts.poppins(
                  fontSize: 33,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}