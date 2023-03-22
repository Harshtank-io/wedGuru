import 'package:flutter/material.dart';
import 'package:wed_guru/pages/addUser.dart';
import 'package:wed_guru/pages/login.dart';
import 'package:wed_guru/pages/pp.dart';
import 'package:wed_guru/pages/preLogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wed Guru',
      home: //ProfilePage(),
      //UserAdd(),
      PreLogin(),
      //LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
