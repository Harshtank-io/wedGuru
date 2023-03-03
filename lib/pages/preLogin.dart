import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wed_guru/pages/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
          enableLoop: true,
          fullTransitionValue: 400,
          waveType: WaveType.liquidReveal,
          slideIconWidget: const Icon(Icons.arrow_back_ios_rounded),
          enableSideReveal: true,
          pages: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.pinkAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(
                      children: [
                        // Text('Welcome',
                        // style: GoogleFonts.poppins(
                        //   fontSize: 35,
                        //   fontWeight: FontWeight.w500,
                        // ),),
                        AnimatedTextKit(
                           repeatForever : true,
                            animatedTexts: [
                              RotateAnimatedText('Welcome Wed guru' ,
                                  textStyle: GoogleFonts.poppins(
                                fontSize: 33,
                                fontWeight: FontWeight.w500,
                              )),
                              RotateAnimatedText('the app for finding true love',textStyle: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                              )),
                              RotateAnimatedText('to meet your partner!',textStyle: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                              )),
                            ]
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('Click Below to Sign in !',
                          style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
          Positioned(
            bottom: 60,
            child: OutlinedButton(
              onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
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

        ],
      ),
    );
  }
}
