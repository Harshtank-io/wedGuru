import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalText extends StatefulWidget {
  const VerticalText({Key? key}) : super(key: key);

  @override
  State<VerticalText> createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
  return  Padding(padding:  EdgeInsets.only(top: 40, left: 10),
  child: RotatedBox(
    quarterTurns: -1,
    child: Text(
      'Sign in',
      style: GoogleFonts.poppins(
        color: Colors.pink,
        fontSize: 38,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  );
  }
}
