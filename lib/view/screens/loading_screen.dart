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

    super.initState();
  }

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
