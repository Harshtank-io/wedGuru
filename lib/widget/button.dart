import 'package:flutter/material.dart';
import 'package:wed_guru/pages/home.dart';



class ButtonLogin extends StatefulWidget {
  const ButtonLogin({super.key});

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 50, left: 200),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child:
        OutlinedButton(
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));},
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            onPrimary: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}