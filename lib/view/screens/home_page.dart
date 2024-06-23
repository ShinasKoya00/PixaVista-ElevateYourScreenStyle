import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/controller/api_operations.dart';
import 'package:pixa_vista/model/photo_category_modal.dart';
import 'package:pixa_vista/model/photos_model.dart';
import 'package:pixa_vista/view/screens/search_page.dart';
import 'package:pixa_vista/view/widgets/category_scroller_container.dart';
import 'package:pixa_vista/view/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> trendingWallpaperList = []; //local variable initialization
  TextEditingController searchController = TextEditingController();

  void searchWallpaper(String query) {
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
    var calculatedHeight = width / 5;

    if (calculatedHeight < height / 5) {
      calculatedHeight = height / 5;
    }
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: const CustomAppBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                                searchWallpaper(inputValue);
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
                height: height - 150,
                width: width,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: photoCategoryList.length,
                  itemBuilder: (context, index) => CategoryScrollerContainer(
                    height: height,
                    width: width,
                    index: index,
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
