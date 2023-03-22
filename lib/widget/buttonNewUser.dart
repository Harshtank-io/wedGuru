import 'package:flutter/material.dart';
import 'package:wed_guru/pages/components/homeNavigation.dart';

class ButtonNewUser extends StatefulWidget {
  @override
  _ButtonNewUserState createState() => _ButtonNewUserState();
}

class _ButtonNewUserState extends State<ButtonNewUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.pinkAccent,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  5.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              ),
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const  HomePage()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'sign up',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}