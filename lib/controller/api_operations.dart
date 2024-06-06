import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixa_vista/model/photos_model.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpaperList = [];

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
        headers: {"Authorization": "e3DEMxtDpLU3bIJw91KeMsJ8Rk9GUjkBqiKETpIP1LEMjE9R4XusMz7h"}).then(
      (value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData["photos"];
        photos.forEach((element) {
          trendingWallpapers.add(PhotosModel.fromApiToApp(element));
        });
      },
    );
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpaper(String query) async {
    await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {"Authorization": "e3DEMxtDpLU3bIJw91KeMsJ8Rk9GUjkBqiKETpIP1LEMjE9R4XusMz7h"}).then(
      (value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData["photos"];
        searchWallpaperList.clear();
        photos.forEach((element) {
          searchWallpaperList.add(PhotosModel.fromApiToApp(element));
        });
      },
    );
    return searchWallpaperList;
  }
}
