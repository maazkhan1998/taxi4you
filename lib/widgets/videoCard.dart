import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoCard extends StatefulWidget {

  final String imagePath;
  final String title;

  VideoCard({@required this.imagePath,@required this.title});
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
                height: ScreenUtil().setHeight(210),
                margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15),horizontal: ScreenUtil().setWidth(20)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 5.0,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 3.0)
                    )
                  ],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0))
                ),
                child: Column(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(165),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(widget.imagePath),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(12.0),right: ScreenUtil().setWidth(8.0),bottom: ScreenUtil().setHeight(3.0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(18.0),
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(top: ScreenUtil().setHeight(4.0)),
                                child: Image.asset(
                                  'assets/play.png',
                                  height: ScreenUtil().setHeight(26.0),
                                  width: ScreenUtil().setWidth(26.0),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
  }
}