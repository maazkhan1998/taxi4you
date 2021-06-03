import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taxiforyou/provider/bottomBarProvider.dart';
import '../widgets/videoCard.dart';

class VideosScr extends StatefulWidget {
  @override
  _VideosScrState createState() => _VideosScrState();
}

class _VideosScrState extends State<VideosScr> {
  List<String> images = [
    'assets/video1.png',
    'assets/NoPath - Kopya (16).png',
    'assets/NoPath - Kopya (17).png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: ScreenUtil().setHeight(65.0),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xFF3DB1A2)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4AA599), Color(0xFF3DB1A2)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 1.0],
            ),
          ),
        ),
        leading: IconButton(
            icon: Image.asset(
              'assets/arrow back.png',
              height: ScreenUtil().setHeight(16.0),
              width: ScreenUtil().setWidth(18.0),
            ),
            onPressed: () {
              Provider.of<BottomBarProvider>(context, listen: false)
                  .updatePageNo(0);
            }),
        title: Text(
          'Videos',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20.0),
              color: Colors.white,
              fontFamily: 'heavy',
            ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/search@3x.png',
              height: ScreenUtil().setHeight(16.0),
              width: ScreenUtil().setWidth(18.0),
              color: Colors.white,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(22.0))
        ],
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(0.0)),
        width: double.infinity,
        child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12.5)),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: ScreenUtil().setHeight(0.0)),
            itemBuilder: (BuildContext context, int index) {
              return VideoCard(
                title: 'Schüler Taxi',
                imagePath: images[index],
              );
            },
            itemCount: 3),
      ),
    );
  }
}
