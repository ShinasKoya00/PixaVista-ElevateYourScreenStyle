import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/controller/api_operations.dart';
import 'package:pixa_vista/model/photos_model.dart';
import 'package:pixa_vista/view/widgets/category_header.dart';
import 'package:pixa_vista/view/widgets/custom_app_bar.dart';
import 'package:pixa_vista/view/widgets/wallpaper_container.dart';

class CategoryPage extends StatefulWidget {
  final String query;
  final String headerBackgroundImage;

  const CategoryPage({
    super.key,
    required this.query,
    required this.headerBackgroundImage,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<PhotosModel> searchResults = [];

  getResults() async {
    searchResults = await ApiOperations.searchWallpaper(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    getResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var calculatedHeight = width / 5;

    if (calculatedHeight < height / 5) {
      calculatedHeight = height / 5;
    }
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: const CustomAppBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CategoryHeader(
                height: height,
                width: width,
                headerQuery: widget.query,
                headerBackgroundImage: widget.headerBackgroundImage,
              ),
              // content grid view

              SizedBox(
                height: height - 200,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: searchResults.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) => WallpaperContainer(
                    imgSrc: searchResults[index].imgSrc,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
