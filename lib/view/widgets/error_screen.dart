import 'package:flutter/material.dart';
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
    String imagePath;
    Widget? actionButton;

    switch (errorType) {
      case ErrorType.noInternet:
        imagePath = "assets/error_handler/no_connection_error.png";
        actionButton = ElevatedButton(
          onPressed: noInternetRetry,
          child: Text("Try again!!"),
        );
        break;
      case ErrorType.notFound404:
        imagePath = "assets/error_handler/404_error.png";
        actionButton = ElevatedButton(
          onPressed: notFound404GoBack,
          child: Text("Go back!!"),
        );
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 100),
        if (actionButton != null) actionButton,
      ],
    );
  }
}
