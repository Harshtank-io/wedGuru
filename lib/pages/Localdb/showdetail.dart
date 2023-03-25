import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wed_guru/database/databasehelper.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar:AppBar(
            backgroundColor: Colors.pink,
            title:Text("Details"),
            //Text(user.name),
            leading: IconButton(
                icon :Icon(Icons.chevron_left),
              onPressed: () { Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserList()));},
            ),
            centerTitle: true,

          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                  child: Center(
                    child: Text(
                      '${user.name.toUpperCase()}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height:2),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                  height: 200,
                  width:  400,
                    decoration: BoxDecoration(
                      color: Colors.pink[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Gender: ${user.gender}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                          ),
                        ),
                        Container(
                            child: Text(
                              'City: ${user.city}',
                              style: GoogleFonts.poppins(
                            color: Colors.white,
                              fontSize: 30,
                            ),)),
                        Container(
                            child: Text(
                              'Description: ${user.description}',
                              style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                        ),)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}


