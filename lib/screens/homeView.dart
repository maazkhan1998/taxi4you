import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:  Color(0xFF3DB1A2)),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16.0),
              color: Colors.white.withOpacity(0.8),
              fontFamily: 'heavy',
            ),
          ),
          actions: [
            GestureDetector(
              onTap: ()=>bookNow(context),
              child: Image.asset(
                'assets/search.png',
                height: ScreenUtil().setHeight(16.0),
                width: ScreenUtil().setWidth(18.0),
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
                      height: ScreenUtil().setHeight(200),
                      width: double.infinity,
                      child: Image.asset(
                        'assets/carimg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black87.withOpacity(0.4)
                          ]
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Zuverlässiger Service',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(24.0),
                                color: Colors.white.withOpacity(0.8)),
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
                                      fontSize: ScreenUtil().setSp(13.5),
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
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)
                  ),
                   boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 5.0,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0))
                  ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Text('Unsere Leistungen',
                          style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: ScreenUtil().setSp(18.0),
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.51))),
                      SizedBox(
                        height: ScreenUtil().setHeight(20.0),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: ScreenUtil().setWidth(30.0),
                        runSpacing: ScreenUtil().setHeight(22.0),
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
                        fontSize: ScreenUtil().setSp(23.0),
                        letterSpacing: 1.15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3DB1A2))),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Image.asset(
                  'assets/group-18.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: ScreenUtil().setHeight(145.0),
                ),
                SizedBox(height: ScreenUtil().setHeight(5),),
                Container(
                  padding:
                      EdgeInsets.only(bottom: ScreenUtil().setHeight(150), left: ScreenUtil().setWidth(35.0), right: ScreenUtil().setWidth(35.5)),
                  child: Text(
                      'Wir verfügen über ein umfangreiches Netzwerk, das wir kontinuierlich ausbauen. Um unseren Kunden auch bei hoher Auslastung die richtige Servicelösung anbieten zu können, tun wir alles dafür.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: ScreenUtil().setSp(14.0),
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.black54)),
                ),
              ],
            ),
          ),
    );
  }
}