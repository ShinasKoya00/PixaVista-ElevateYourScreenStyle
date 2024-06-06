
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixa_vista/constants/colors.dart';

class LoadingScreen extends StatefulWidget {


  const LoadingScreen({
    super.key,

  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // startTimer();
    super.initState();
  }

  // startTimer() {
  //   var duration = Duration(seconds: 5);
  //   return Timer(duration, navigateToNextPage(widget.nextPage));
  // }

  // navigateToNextPage(Widget nextPage) {
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Center(
        child: Lottie.asset("assets/loading_animations/page_loading_animation.json"),
      ),
    );
  }
}
