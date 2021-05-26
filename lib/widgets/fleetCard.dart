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
      height: ScreenUtil().setHeight(250.0),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
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
            top: -10.0,
            child: Image.asset(widget.image),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.carName,
                  style: TextStyle(
                      fontFamily: 'heavy',
                      fontSize: 18.5,
                      color: Colors.black.withOpacity(0.51)),
                ),
                Text(
                  'HYBRID',
                  style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.31)),
                ),
                SizedBox(height: ScreenUtil().setHeight(20.0)),
                Container(
                  width: 68.0,
                  child: Text(
                    'Details Anzeigen',
                    style: TextStyle(
                      height: 1.08,
                      color: Theme.of(context).primaryColor,
                      fontSize: 14.0,
                      fontFamily: 'heavy',
                    ),
                  ),
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
                            fontSize: 15.0,
                            fontFamily: 'heavy',
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(4.0)),
                        Text(
                          'Gepäck :',
                          style: TextStyle(
                            height: 1.25,
                            color: Colors.black.withOpacity(0.51),
                            fontSize: 15.0,
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
                            color: Colors.black.withOpacity(0.41),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'heavy',
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(4.0)),
                        Container(
                          width: ScreenUtil().setWidth(142.0),
                          child: Text(
                            widget.luggage,
                            style: TextStyle(
                              height: 1.3,
                              color: Colors.black.withOpacity(0.41),
                              fontSize: 14.0,
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
          ))
        ],
      ),
    );
  }
}
