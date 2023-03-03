import 'package:flutter/material.dart';
import 'package:wed_guru/widget/button.dart';
import 'package:wed_guru/widget/signup.dart';
import 'package:wed_guru/widget/newEmail.dart';
import 'package:wed_guru/widget/buttonNewUser.dart';
import 'package:wed_guru/widget/password.dart';
import 'package:wed_guru/widget/newName.dart';
import 'package:wed_guru/widget/textNew.dart';
import 'package:wed_guru/widget/userold.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        color: Colors.pink,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SignUp(),
                    TextNew(),
                  ],
                ),
                NewName(),
                NewEmail(),
                PasswordInput(),
                ButtonLogin(),
                UserOld(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
