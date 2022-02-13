import 'package:flutter/material.dart';
import 'package:insta/home_screen/home_s.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
