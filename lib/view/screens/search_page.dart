import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/constants/error_enum.dart';
import 'package:pixa_vista/controller/api_operations.dart';
import 'package:pixa_vista/model/photos_model.dart';
import 'package:pixa_vista/view/screens/home_page.dart';
import 'package:pixa_vista/view/screens/loading_screen.dart';
import 'package:pixa_vista/view/screens/splash_screen.dart';
import 'package:pixa_vista/view/widgets/category_header.dart';

import 'package:pixa_vista/view/widgets/custom_app_bar.dart';
import 'package:pixa_vista/view/widgets/error_screen.dart';
import 'package:pixa_vista/view/widgets/wallpaper_container.dart';

class SearchPage extends StatefulWidget {
  final String query;

  const SearchPage({
    super.key,
    required this.query,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<PhotosModel> searchResults = [];
  bool isLoading = true;
  bool isError = false;
  bool noResultsFound = false;
  late Timer _timer;

  void searchPhotoTextField(String searchPageQuery) {
    searchPageQuery = searchPageQuery.trim();
    if (searchPageQuery.isEmpty) {
      log("Blank search");
    } else {
      log("search pressed");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(
                  query: searchPageQuery,
                )),
      );

      _timer = Timer(Duration(seconds: 10), () {
        searchController.clear();
      });
    }
  }

  // getResults() async {
  //   try {
  //     searchResults = await ApiOperations.searchWallpaper(widget.query);
  //     if (searchResults.isEmpty) {
  //       await Future.delayed(Duration(seconds: 3));
  //       if (mounted) {
  //         setState(() {
  //           noResultsFound = true;
  //         });
  //       }
  //     } else {
  //       if (mounted) {
  //         setState(() {
  //           noResultsFound = false;
  //         });
  //       }
  //     }
  //   } catch (error) {
  //     if (mounted) {
  //       setState(() {
  //         isError = true;
  //       });
  //     }
  //     log("Error fetching results : $error");
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }
  getResults() async {
    searchResults = await ApiOperations.searchWallpaper(widget.query);
    setState(() {});
  }

  void _startTimer() {
    const duration = Duration(seconds: 3);
    _timer = Timer(duration, () {
      setState(() {
        isLoading = false; // Set isLoading to false after 5 seconds
      });
    });
  }

  @override
  void initState() {
    getResults();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: const CustomAppBar(),
        centerTitle: true,
      ),
      body: isLoading
          ? LoadingScreen()
          // : noResultsFound
          //     ? ErrorScreen(
          //         errorType: ErrorType.notFound404,
          //         notFound404GoBack: () {
          //           Navigator.pop(context);
          //         },
          //       )
          //     : isError
          //         ? Center(
          //             child: Text("'An error occurred. Please try again later..."),
          //           )
          : SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
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
                                      searchPhotoTextField(inputValue);
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
                    if (searchResults.isNotEmpty)
                      CategoryHeader(
                        width: width,
                        headerQuery: widget.query,
                        headerBackgroundImage: searchResults[5].imgSrc,
                      )
                    else
                      Container(
                        height: 150,
                        width: width,
                        decoration: BoxDecoration(
                          color: MyColors.lightGreen1,
                          borderRadius: BorderRadius.circular(15),
                        ), // Placeholder color or image
                      ),

                    // content grid view
                    Container(
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
