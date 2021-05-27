import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/utils/SizeConfig.dart';
import 'package:taxiforyou/widgets/dialogs.dart';
import 'package:taxiforyou/widgets/serviceCard.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
          titleSpacing: MySize.size34,
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white.withOpacity(0.8),
              fontFamily: 'heavy',
            ),
          ),
          actions: [
            GestureDetector(
              onTap: ()=>bookNow(context),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(150),
                      width: double.infinity,
                      child: Image.asset(
                        'assets/carimg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(150),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Zuverlässiger Service',
                            style: TextStyle(
                                fontFamily: 'heavy',
                                fontSize: 24.0,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(35.0),
                            width: ScreenUtil().setWidth(265.0),
                            child: ElevatedButton(
                              child: Text('ANFRAGE ABSCHICKEN',
                                  style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.8))),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF3DB1A2)),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: ScreenUtil().setHeight(460),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 5.0,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 3.0))
                  ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text('Unsere Leistungen',
                          style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.51))),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: ScreenUtil().setWidth(30),
                        runSpacing: ScreenUtil().setHeight(22),
                        children: [
                          ServiceCard(
                              image: 'assets/page-1 (1).png',
                              service: 'Schüler Taxi'),
                          ServiceCard(
                              image: 'assets/page-1(2).png',
                              service: 'Behinderte-ntransport'),
                          ServiceCard(
                              image: 'assets/page-1(3).png',
                              service: 'Concierge '),
                          ServiceCard(
                              image: 'assets/page-1(4).png',
                              service: 'Roadshows'),
                          ServiceCard(
                              image: 'assets/page-1(5).png',
                              service: 'Schüler Taxi'),
                          ServiceCard(
                              image: 'assets/page-1(6).png',
                              service: 'Reiseplanung')
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20.0),
                ),
                Text('Verbreitetes Netzwerk',
                    style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 23,
                        letterSpacing: 1.15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3DB1A2))),
                SizedBox(
                  height: ScreenUtil().setHeight(3.0),
                ),
                Image.asset(
                  'assets/group-18.png',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: ScreenUtil().setHeight(145.0),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20.0),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 150.0, left: 35.0, right: 35.0),
                  child: Text(
                      'Wir verfügen über ein umfangreiches Netzwerk, das wir kontinuierlich ausbauen. Um unseren Kunden auch bei hoher Auslastung die richtige Servicelösung anbieten zu können, tun wir alles dafür.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.black87)),
                ),
              ],
            ),
          ),
    );
  }
}