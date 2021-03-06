import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taxiforyou/provider/bottomBarProvider.dart';
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
        backgroundColor: Colors.transparent.withOpacity(0),
        automaticallyImplyLeading: false,
          titleSpacing: MySize.size34,
          toolbarHeight: ScreenUtil().setHeight(65.0),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:  Color(0xFF3DB1A2)),
          flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(74, 165, 153, 1),
                 Color.fromRGBO(51, 188, 170, 1)
                 ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 1.0],
            ),
          ),
        ),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20.0),
              color: Colors.white,
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
                      height: ScreenUtil().setHeight(205.5),
                      width: double.infinity,
                      child: Image.asset(
                        'assets/carimg@3x.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(205.5),
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
                            'Zuverl??ssiger Service',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(26.0),
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10.0),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(40.0),
                            width: ScreenUtil().setWidth(300),
                            child: ElevatedButton(
                              child: Text('ANFRAGE ABSCHICKEN',
                                  style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: ScreenUtil().setSp(15),
                                      letterSpacing: -0.1,
                                      color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF3DB1A2)),
                              onPressed: () => Provider.of<BottomBarProvider>(context,listen:false).updatePageNo(1),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(25.0),
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
                        offset: Offset(0, ScreenUtil().setHeight(7)))
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
                              image: 'assets/page-1@3x (1).png',
                              service: 'Sch??ler Taxi'),
                          ServiceCard(
                              image: 'assets/page-1@3x(2).png',
                              service: 'Behinderte-ntransport'),
                          ServiceCard(
                              image: 'assets/page-1@3x(3).png',
                              service: 'Concierge '),
                          ServiceCard(
                              image: 'assets/page-1@3x(4).png',
                              service: 'Roadshows'),
                          ServiceCard(
                              image: 'assets/page-1@3x(5).png',
                              service: 'Sch??ler Taxi'),
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
                  'assets/group-18@3x.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: ScreenUtil().setHeight(145.0),
                ),
                SizedBox(height: ScreenUtil().setHeight(15),),
                Container(
                  padding:
                      EdgeInsets.only(bottom: ScreenUtil().setHeight(150), left: ScreenUtil().setWidth(35.0), right: ScreenUtil().setWidth(35.5)),
                  child: Text(
                      'Wir verf??gen ??ber ein umfangreiches Netzwerk, das wir kontinuierlich ausbauen. Um unseren Kunden auch bei hoher Auslastung die richtige Servicel??sung anbieten zu k??nnen, tun wir alles daf??r.',
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