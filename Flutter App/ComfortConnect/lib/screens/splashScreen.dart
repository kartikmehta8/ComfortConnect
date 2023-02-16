import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:talkspace/screens/SignUpForm.dart';
import 'package:talkspace/screens/signup_page.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  // ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //   context,
      //   PageTransition(
      //       child: const MentalHealthApp(),
      //       type: PageTransitionType.leftToRight),
      // );
      Navigator.pushReplacement(
        context,
        PageTransition(
            child: SignUpForm(), type: PageTransitionType.leftToRight),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.45,
            ),
            // Container(
            //   child: Image.asset('assets/images/bus-karo-logo-transparent.png'),
            // ),
            RichText(
              text: const TextSpan(
                text: 'ComfortConnect',
                style: TextStyle(
                  // fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.45,
            ),
            const Text(
              'Made with ❤️ by status(200)',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            // RichText(
            //   text: const TextSpan(
            //     text: 'Made with ❤️ by Divyansh',
            //     style: TextStyle(
            //       // fontFamily: GoogleFonts.poppins().fontFamily,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 15.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
