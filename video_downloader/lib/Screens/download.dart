import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  Download({Key? key}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Download Page"),
      ),
    );
  }
}
