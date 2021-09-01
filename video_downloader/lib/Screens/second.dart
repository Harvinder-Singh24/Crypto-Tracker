import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:video_downloader/Screens/homepage.dart';
import 'package:video_downloader/Screens/download.dart';

class Second extends StatefulWidget {
  Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomePage(), Download()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.personalhotspot),
        textStyle: TextStyle(
            fontSize: 20,
            fontFamily:
                GoogleFonts.lato(fontWeight: FontWeight.w400).fontFamily),
        title: "Url",
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cloud_download_fill),
        textStyle: TextStyle(
            fontSize: 20,
            fontFamily:
                GoogleFonts.lato(fontWeight: FontWeight.w400).fontFamily),
        title: "Videos",
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Image.asset(
                "assest/logo.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Downloader",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.lato(fontWeight: FontWeight.w300)
                        .fontFamily),
              ),
              Spacer(),
              Text(
                "v1.0",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.lato(fontWeight: FontWeight.w300)
                        .fontFamily),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style1, // Choose the nav bar style with this property.
          ),
        ),
      ),
    );
  }
}
