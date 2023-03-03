import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UserLike extends StatefulWidget {
  const UserLike({Key? key}) : super(key: key);

  @override
  State<UserLike> createState() => _UserLikeState();
}

class _UserLikeState extends State<UserLike> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Baki Chhe ',
          style: GoogleFonts.poppins(
            fontSize: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
