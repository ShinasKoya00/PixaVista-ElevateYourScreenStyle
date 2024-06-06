import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/view/screens/full_screen.dart';

class WallpaperContainer extends StatelessWidget {
  final String imgSrc;

  const WallpaperContainer({
    super.key,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullScreen(imageUrl: imgSrc),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyColors.lightGreen1,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imgSrc,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
