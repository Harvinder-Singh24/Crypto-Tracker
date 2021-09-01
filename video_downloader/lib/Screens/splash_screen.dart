import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'second.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Second(),
      duration: 5000,
      imageSize: 130,
      imageSrc: 'assest/logo.png',
      text: "Video Downloder",
      textType: TextType.TyperAnimatedText,
      textStyle:
          TextStyle(fontSize: 30.0, fontFamily: GoogleFonts.lato().fontFamily),
      backgroundColor: Colors.white,
    );
  }
}
