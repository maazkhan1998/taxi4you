import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/videoCard.dart';

class VideosScr extends StatefulWidget {
  @override
  _VideosScrState createState() => _VideosScrState();
}

class _VideosScrState extends State<VideosScr> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/arrow back.png',
              height: 16.0,
              width: 18.0,
            ),
            onPressed: () {}),
        title: Text(
          'Videos',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white.withOpacity(0.8),
            fontFamily: 'heavy',
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/search.png',
              height: 16.0,
              width: 18.0,
              color: Colors.white,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(22.0))
        ],
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        width: double.infinity,
        child: ListView.separated(

            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: ScreenUtil().setHeight(5.0)),
            itemBuilder: (BuildContext context, int index) {
              return VideoCard(title: 'Schuler Taxi',imagePath: 'assets/carimg.jpeg',) ;
            },
            itemCount: 3),
      ),
    ));
  }
}
