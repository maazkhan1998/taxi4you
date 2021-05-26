import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/SizeConfig.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  serviceCard(String image, String service) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:5),
      height: ScreenUtil().setHeight(140.0),
      width: ScreenUtil().setWidth(140.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey.shade300, blurRadius: 10.0)
      ],
      borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 4.0),
              child: Image.asset(
                'assets/play.png',height: 22.0,width: 22.0,
              ),
            ),
          ),
          Image.asset(
            image,
            height: 55.0,
            width: 89.0,
          ),
          SizedBox(height: ScreenUtil().setHeight(8.0)),
          Text(
            service,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(14.0),
                color: Colors.black.withOpacity(0.5),
                fontFamily: 'heavy'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: MySize.size34,
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white.withOpacity(0.8),
                fontFamily: 'heavy',),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: ScreenUtil().setHeight(185.0),
                      width: double.infinity,
                      child: Image.asset(
                                'assets/carimg.png',
                                fit: BoxFit.cover,
                              ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(185.0),
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
                height: ScreenUtil().setHeight(580.0),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, 
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 5.0,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 3.0)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(15.0),
                    ),
                    Text('Unsere Leistungen',
                        style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.51))),
                    SizedBox(
                      height: ScreenUtil().setHeight(26.0),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,spacing: 30.0,runSpacing: 24.0,
                      children: [
                        serviceCard('assets/page-1 (1).png', 'Schüler Taxi'),
                        serviceCard(
                            'assets/page-1(2).png', 'Behinderte-ntransport'),
                        serviceCard('assets/page-1(3).png', 'Concierge '),
                        serviceCard('assets/page-1(4).png', 'Roadshows'),
                        serviceCard('assets/page-1(5).png', 'Schüler Taxi'),
                        serviceCard('assets/page-1(6).png', 'Reiseplanung')
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
                      fontSize: 21.5,letterSpacing: 1.15,
                      fontWeight: FontWeight.bold,
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
                padding: EdgeInsets.only(bottom: 150.0,left: 35.0,right: 35.0),
                child: Text(
                    'Wir verfügen über ein umfangreiches Netzwerk, das wir kontinuierlich ausbauen. Um unseren Kunden auch bei hoher Auslastung die richtige Servicelösung anbieten zu können, tun wir alles dafür.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.black54)),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {},
        // ),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   elevation: 0.5,
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 4.0,
        //   child: new Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[],
        //   ),
        // )
      ),
    );
  }
}
