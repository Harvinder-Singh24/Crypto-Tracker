import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String youtube_link = "";

void start_download(youTube_link, BuildContext context) async {
  final result = await FlutterYoutubeDownloader.downloadVideo(
      youTube_link, "Video Title goes Here", 18);
  print(result);
  showToast("Invalid Download Link",
      backgroundColor: Colors.grey,
      context: context,
      animation: StyledToastAnimation.fade);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              text_field(),
              SizedBox(
                height: 50,
              ),
              download_button(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget text_field() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 200.h, left: 30.w, right: 30.w),
      child: TextField(
        onChanged: (v) {
          youtube_link = v;
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelText: "Youtube Link",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          prefixIcon: Icon(
            Icons.paste_rounded,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 3.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget download_button(BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (youtube_link.isEmpty) {
        showToast("Enter Link First",
            backgroundColor: Colors.grey,
            context: context,
            animation: StyledToastAnimation.fade);
      } else if (youtube_link.contains("https://www.youtube.com/watch?v=")) {
        start_download(youtube_link, context);
      } else {
        showToast("Invalid Download Link",
            backgroundColor: Colors.grey,
            context: context,
            animation: StyledToastAnimation.fade);
      }
    },
    child: Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          "Download Video",
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
        ),
      ),
    ),
  );
}
