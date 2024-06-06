import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pixa_vista/controller/api_operations.dart';
import 'package:pixa_vista/model/photo_category_modal.dart';
import 'package:pixa_vista/model/photos_model.dart';
import 'package:pixa_vista/view/screens/search_page.dart';
import 'package:pixa_vista/view/widgets/category_scroller.dart';
import 'package:pixa_vista/view/widgets/custom_app_bar.dart';
import 'package:pixa_vista/view/widgets/wallpaper_container.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> trendingWallpaperList = []; //local variable initialization
  TextEditingController searchController = TextEditingController();

  void searchRecipe(String query) {
    query = query.trim();
    if (query.isEmpty) {
      log("Blank search");
    } else {
      log("search pressed");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(
                  query: query,
                )),
      );

      Timer(Duration(seconds: 10), () {
        searchController.clear();
      });
    }
  }

  getTrendingWallpaper() async {
    trendingWallpaperList = await ApiOperations.getTrendingWallpapers();
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 55,
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search wallpaper here...",
                                hintStyle: TextStyle(color: Colors.grey.shade400),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (inputValue) {
                                searchRecipe(inputValue);
                              },
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 22,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, top: 5),
                height: 50,
                width: width,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: photoCategoryList.length,
                  itemBuilder: (context, index) => CategoryScroller(
                    width: width,
                    index: index,
                  ),
                ),
              ),

              // content grid view
              SizedBox(
                height: height - 260,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: trendingWallpaperList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) => WallpaperContainer(
                    imgSrc: trendingWallpaperList[index].imgSrc,
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
