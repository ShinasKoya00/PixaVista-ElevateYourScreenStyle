import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/constants/error_enum.dart';

class ErrorScreen extends StatelessWidget {
  final ErrorType errorType;
  final VoidCallback? noInternetRetry;
  final VoidCallback? notFound404GoBack;

  const ErrorScreen({
    Key? key, // Corrected parameter name
    required this.errorType,
    this.noInternetRetry,
    this.notFound404GoBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String svgIconPath;
    String errorHeader;
    String errorBody;
    Widget? actionButton;

    switch (errorType) {
      case ErrorType.noInternet:
        svgIconPath = "assets/svg_icons/no-internet.svg";
        errorHeader = "No Internet Connection";
        errorBody = "Please connect to the internet.";
        actionButton = _customErrorButton("Try again!!");
        break;
      case ErrorType.notFound404:
        svgIconPath = "assets/svg_icons/404-page-not-found-2.svg";
        errorHeader = "404 - Page Not Found";
        errorBody = "Page is currently not available.";
        actionButton = _customErrorButton("Go back!!");
        break;
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ooopss...!",
              style: GoogleFonts.poppins(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: MyColors.darkGreen,
              ),
            ),
            SvgPicture.asset(height: 340, svgIconPath),
            SizedBox(height: 40),
            Text(
              errorHeader,
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: MyColors.darkGreen,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We're sorry,",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.darkGreen,
              ),
            ),
            SizedBox(height: 2),
            Text(
              errorBody,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.darkGreen,
              ),
            ),
            SizedBox(height: 80),
            if (actionButton != null) actionButton,
          ],
        ),
      ),
    );
  }

  GestureDetector _customErrorButton(String title) {
    return GestureDetector(
      onTap: notFound404GoBack,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: -5.0,
            ),
          ],
        ),
        child: Text(title, style: TextStyle(color: MyColors.backgroundColor, fontSize: 19)),
      ),
    );
  }
}
