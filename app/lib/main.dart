import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
var profile_image = 'assest/1.jpg';

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "assest/insta.jpg",
          height: 60.h,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black,
                    ),
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.red,
                      child: Text(
                        "30",
                        style: TextStyle(fontSize: 7, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomPart(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
            Story(),
              Divider(),
              Post()
            ],
          ),
        ),
      ),
    );
  }
}

Widget BottomPart() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: BottomAppBar(
      elevation: 0,
      child: Row(
        children: [
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ondemand_video,
              size: 30,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
          ),
          Spacer(),
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage("assest/story.png"),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage("assest/1.jpg"),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ),
  );
}

Widget Story() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        10,
            (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.h),
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  backgroundImage: AssetImage("assest/story.png"),
                  child: CircleAvatar(
                    radius: 37,
                    backgroundImage: AssetImage(profile_image),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                names[index],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget Post() {
  return Column(
    children: List.generate(
      8,
      (index) => Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  backgroundImage: AssetImage("assest/story.png"),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(posts[index]),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Text(post_names[index]),
              Spacer(),
              Icon(Icons.more_vert)
            ],
          ),

        ],
      ),
    ),
  );
}
