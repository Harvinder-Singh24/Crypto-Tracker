import 'package:flutter/material.dart';
import 'package:insta/Reel/download_reel.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Insta Downloader" , style: TextStyle(
        color: Colors.black,
        fontFamily: GoogleFonts.lato().fontFamily
      ) ,


      ),
      backgroundColor: Colors.white,),
      body: BodyPart(),
    );
  }
}
