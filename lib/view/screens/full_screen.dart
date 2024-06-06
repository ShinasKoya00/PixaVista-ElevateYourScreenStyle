import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  bool _showBanner = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Stack(
        children: [
          Hero(
            tag: widget.imageUrl,
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      downloadImage();
                    },
                    child: Container(
                      height: 60,
                      width: width / 1.5,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0x56ffffff), Color(0x20ffffff)]),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white54, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Set Wallpaper",
                            style:
                                TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            "Image will be saved in the gallery",
                            style: TextStyle(fontSize: 12.0, color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (_showBanner)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: CustomMaterialBannerWidget(),
              ),
            ),
        ],
      ),
    );
  }

  void downloadImage() async {
    try {
      await GallerySaver.saveImage(widget.imageUrl, albumName: "PixaVista").then((success) {
        log("image saved");
        setState(() {
          _showBanner = true;
        });

        Timer(const Duration(milliseconds: 1500), () {
          setState(() {
            _showBanner = false;
          });
        });
      });
    } catch (e) {
      log('downloadImageE: $e');
    }
  }
}

class CustomMaterialBannerWidget extends StatelessWidget {
  const CustomMaterialBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      elevation: 50,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: "Oh Hey!!",
        message: 'Image saved successfully!',
        contentType: ContentType.success,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );
  }
}
