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
                height: ScreenUtil().setHeight(185.0),
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
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
                      height: ScreenUtil().setHeight(140),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(widget.imagePath),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 12.0,right: 8.0,bottom: 3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: 'heavy',
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(top: 4.0),
                                child: Image.asset(
                                  'assets/play.png',
                                  height: 26.0,
                                  width: 26.0,
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