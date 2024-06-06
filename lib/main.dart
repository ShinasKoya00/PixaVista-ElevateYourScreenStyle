import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixa_vista/constants/colors.dart';
import 'package:pixa_vista/constants/error_enum.dart';
import 'package:pixa_vista/view/screens/home_page.dart';
import 'package:pixa_vista/view/screens/splash_screen.dart';
import 'package:pixa_vista/view/widgets/error_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.backgroundColor),
          focusColor: MyColors.backgroundColor,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: SplashScreen());
  }
}
