import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/view/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = Duration(milliseconds: 3800);
    return Timer(duration, navigateToHomePage);
  }

  void navigateToHomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Container(
        child: Center(
          child: Lottie.asset("assets/loading_animations/splash_screen_animation.json"),
        ),
      ),
    );
  }
}
