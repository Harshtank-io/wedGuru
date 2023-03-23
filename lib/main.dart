import 'package:flutter/material.dart';
import 'package:wed_guru/pages/loginComponents/preLogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wed Guru',
      home: PreLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
