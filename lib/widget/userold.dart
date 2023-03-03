import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wed_guru/pages/login.dart';
class UserOld extends StatelessWidget {
  const UserOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top:140,left: 110),
      child: Container(
        alignment: Alignment.topRight,
        height: 20,
        child: Row(
          children: <Widget>[
           const  Text(
              'Have we Met Before?',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white
              ),
            ),
            SizedBox(width: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: StadiumBorder()),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }, child:  Text(
              'sign in',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color:Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
            )
          ],
        ),
      ),
    );
  }
}
