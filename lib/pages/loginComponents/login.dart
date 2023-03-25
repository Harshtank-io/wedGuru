import 'package:flutter/material.dart';
import 'package:wed_guru/widget/verticaltext.dart';
import 'package:wed_guru/widget/inputEmail.dart';
import 'package:wed_guru/widget/password.dart';
import 'package:wed_guru/widget/button.dart';
import 'package:wed_guru/widget/first.dart';
import 'package:wed_guru/widget/textLogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("lib/img/bg.jpg"),
          //   fit: BoxFit.cover,
          //   opacity: 0.7,
          //   alignment: Alignment.center,
          // gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
              color: Colors.pink,
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                 FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

