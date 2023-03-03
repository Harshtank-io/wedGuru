import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wed_guru/pages/newuser.dart';

class FirstTime extends StatefulWidget {
  const FirstTime({Key? key}) : super(key: key);

  @override
  State<FirstTime> createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.only(top:240,left: 150),
      child: Container(
        alignment: Alignment.center,
        height: 20,
        child: Row(
          children:  <Widget>[
            const Text(
              'first time ?',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: StadiumBorder()),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewUser()));
              },
              child: Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  fontSize:12,
                  color: Colors.white,
                ),
              //  textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ),
    );
  }
}
