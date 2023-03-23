import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    this.text = "Persons",
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/img/p1.jpg"),
                ),
                 ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(text,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500)),
                        Padding(padding: EdgeInsets.only(bottom: 8.0)),
                        Text("$text Biography",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}