import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreen extends StatelessWidget {
  final String imageUrl;

  FullScreen({super.key, required this.imageUrl});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> setWallpaperFromFile(String wallpaperUrl, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Download Starting..."),
    ));

//     try {
// // saving the image
//       var imageId = await ImageDownloader.downloadImage(wallpaperUrl);
//       if (imageId == null) {
//         return;
//       }
//       // below is the method to obtain saved info of saved image
//       var fileName = await ImageDownloader.findName(imageId);
//       var path = await ImageDownloader.findPath(imageId);
//       var size = await ImageDownloader.findByteSize(imageId);
//       var mimeType = await ImageDownloader.findMimeType(imageId);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Successful")));
//       print("IMAGE DOWNLOADED");
//     } on PlatformException catch (error) {
//       print(error);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Occured - $error")));
//     }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
