import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/model/photo_category_modal.dart';
import 'package:pixa_vista/view/screens/category_page.dart';

class CategoryScrollerContainer extends StatelessWidget {
  final double height;
  final double width;

  final int index;

  const CategoryScrollerContainer({
    super.key,
    required this.width,
    required this.index,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = width / 5;

    if (calculatedHeight < height / 5) {
      calculatedHeight = height / 5;
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      query: photoCategoryList[index]["heading"],
                      headerBackgroundImage: photoCategoryList[index]["backGroundImage"],
                    )));
      },
      child: Container(
          height: calculatedHeight,
          width: width,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: MyColors.lightGreen1,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(0.0, 12.0),
                  blurRadius: 10.0,
                  spreadRadius: -5.0,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(photoCategoryList[index]["backGroundImage"]), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Container(
                height: calculatedHeight,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    MyColors.black70,
                    Colors.transparent,
                    MyColors.black70,
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: calculatedHeight,
                width: width,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(bottom: 15, left: 20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  photoCategoryList[index]["heading"],
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
            ],
          )),
    );
  }
}
