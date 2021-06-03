import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FleetCard extends StatefulWidget {
  final String carName;
  final String image;
  final String capacity;
  final String luggage;

  FleetCard({this.image, this.capacity, this.luggage, this.carName});

  @override
  _FleetCardState createState() => _FleetCardState();
}

class _FleetCardState extends State<FleetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(270),
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5), horizontal: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 5.0,
                blurRadius: 15.0,
                offset: Offset(0.0, 3.0))
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          Positioned(
            right: -128.0,
            top: 0.0,
            child: Container(
              height: 175,width: 380,
              child: Image.asset(widget.image)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20), vertical: ScreenUtil().setHeight(12)),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.carName,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(18.0),
                  fontWeight: FontWeight.w200,
                  letterSpacing: -0.95,
                  fontFamily: 'heavy',
                  color: Color.fromRGBO(51, 51, 51, 0.95)),
            ),
            Text(
              'HYBRID',
              style: TextStyle(
                  fontFamily: 'medium',
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[300]),
            ),
            SizedBox(height: ScreenUtil().setHeight(35.0)),
            Container(
              width: ScreenUtil().setWidth(68),
              child: Text(
                'Details Anzeigen',
                style: TextStyle(
                  height: 1.3,
                  color: Colors.teal.withOpacity(0.5),
                  fontSize: 14.0,
                  fontFamily: 'heavy',
                ),
              ),
            ),
            Divider(
              endIndent: MediaQuery.of(context).size.width*0.55,
            ),
            SizedBox(height: ScreenUtil().setHeight(20.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kapazität :',
                      style: TextStyle(
                        height: 1.25,
                        color: Colors.black.withOpacity(0.51),
                        fontSize: ScreenUtil().setSp(15.0),
                        fontFamily: 'heavy',
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(4.0)),
                    Text(
                      'Gepäck :',
                      style: TextStyle(
                        height: 1.25,
                        color: Colors.black.withOpacity(0.51),
                        fontSize: ScreenUtil().setSp(15.0),
                        fontFamily: 'heavy',
                      ),
                    )
                  ],
                ),
                SizedBox(width: ScreenUtil().setWidth(10.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.capacity,
                      style: TextStyle(
                        height: 1.3,
                        color: Colors.black.withOpacity(0.5),
                        fontSize: ScreenUtil().setSp(15.0),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'heavy',
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(6)),
                    Container(
                      width: ScreenUtil().setWidth(142.0),
                      child: Text(
                        widget.luggage,
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.black.withOpacity(0.5),
                          fontSize: ScreenUtil().setSp(14.0),
                          wordSpacing: 3,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'heavy',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
            ),
          )
        ],
      ),
    );
  }
}
