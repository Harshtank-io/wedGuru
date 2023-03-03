import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.only(top: 60,left: 10),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          'Sign up',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
