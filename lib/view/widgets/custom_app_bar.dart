import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Pixa",
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        children: [
          TextSpan(),
          TextSpan(
            text: "Vista",
            style: TextStyle(color: Colors.orange, fontSize: 20),
          )
        ],
      ),
    );
  }
}
