import 'package:flutter/material.dart';
import 'package:pixa_vista/model/photo_category_modal.dart';
import 'package:pixa_vista/view/screens/category_page.dart';


class CategoryScroller extends StatelessWidget {
  final double? width;

  final int index;

  const CategoryScroller({
    super.key,
    this.width,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
      child: Stack(
        children: [
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                photoCategoryList[index]["backGroundImage"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              photoCategoryList[index]["heading"],
              // "text",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
