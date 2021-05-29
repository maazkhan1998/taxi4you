import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taxiforyou/provider/bottomBarProvider.dart';

class ServiceCard extends StatefulWidget {
  final String image;
  final String service;

  const ServiceCard({this.image, this.service});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<BottomBarProvider>(context,listen:false).updatePageNo(4);
      },
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: ScreenUtil().setHeight(112.0),
        width: ScreenUtil().setWidth(140.0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10.0)],
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Image.asset(
                  'assets/play.png',
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setWidth(20),
                ),
              ),
            ),
            Image.asset(
              widget.image,
              height: ScreenUtil().setHeight(40),
              width: ScreenUtil().setWidth(89),
            ),
            SizedBox(height: ScreenUtil().setHeight(8.0)),
            Text(
              widget.service,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14.0),
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'heavy'),
            ),
          ],
        ),
      ),
    );
  }
}
