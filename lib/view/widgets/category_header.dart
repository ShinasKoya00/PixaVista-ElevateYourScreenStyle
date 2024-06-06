import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String headerQuery;
  final String headerBackgroundImage;

  const CategoryHeader({
    super.key,
    required this.width, required this.headerQuery, required this.headerBackgroundImage,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(
              headerBackgroundImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "category",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            headerQuery,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
