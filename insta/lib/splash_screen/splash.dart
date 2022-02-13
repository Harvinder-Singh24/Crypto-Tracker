import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta/main_screen/main_s.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Main(),
      duration: 5000,
      imageSize: 100,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      imageSrc: 'assest/instagram.png',
      text: "Download Reels And Earn",
      textType: TextType.TyperAnimatedText,
      textStyle:
          TextStyle(fontSize: 20.sp, fontFamily: GoogleFonts.lato().fontFamily),
      backgroundColor: Colors.white,
    );
  }
}
