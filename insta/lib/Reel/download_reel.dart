import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:insta/globals/global.dart';

class BodyPart extends StatefulWidget {
  BodyPart({Key? key}) : super(key: key);

  @override
  _BodyPartState createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  FlutterInsta flutterInsta = FlutterInsta(); // create instance of FlutterInsta class
  TextEditingController usernameController = TextEditingController();
  TextEditingController reelController = TextEditingController();


  String? username, followers = " ", following, bio, website, profileimage;
  bool pressed = false;
  bool downloading = false;

  @override
  void initState() {
    super.initState();
    initializeDownloader();
    downloadReels();
  }

  void initializeDownloader() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(debug: true // optional: set false to disable printing logs to console
    );
  }

  void downloadReels() async {
    var s = await flutterInsta.downloadReels("https://www.instagram.com/p/CDlGkdZgB2y");
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package example app')
      ),
      body:
    );

    Widget reelPage() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: reelController,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                downloading = true; //set to true to show Progress indicator
              });
              download();
            },
            child: Text("Download"),
          ),
          downloading
              ? Center(
            child: CircularProgressIndicator(), //if downloading is true show Progress Indicator
          )
              : Container()
        ],
      );
    }

//Download reel video on button clickl
    void download() async {
      var myvideourl = await flutterInsta.downloadReels(reelController.text);

      await FlutterDownloader.enqueue(
        url: '$myvideourl',
        savedDir: '/sdcard/Download',
        showNotification: true,
        // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      ).whenComplete(() {
        setState(() {
          downloading = false; // set to false to stop Progress indicator
        });
      });
    }
  }