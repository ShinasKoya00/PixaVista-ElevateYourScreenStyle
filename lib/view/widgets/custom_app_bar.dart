import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Pixa",
          style: TextStyle(color: MyColors.darkGreen2, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 2),
        Text(
          "Vista",
          style: TextStyle(color: MyColors.darkGreen, fontSize: 25, fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
