import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/widgets/dialogs.dart';

import '../widgets/fleetCard.dart';

class OurFleetScr extends StatefulWidget {
  @override
  _OurFleetScrState createState() => _OurFleetScrState();
}

class _OurFleetScrState extends State<OurFleetScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:  Color(0xFF3DB1A2)),
    leading: IconButton(
        icon: Image.asset(
          'assets/arrow back.png',
          height: ScreenUtil().setHeight(16.0),
          width: ScreenUtil().setWidth(18.0),
        ),
        onPressed: () {}),
    title: Text(
      'Unsere Flotte',
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
          'assets/search@3x.png',
          height: ScreenUtil().setHeight(16.0),
          width: ScreenUtil().setWidth(18.0),
          color: Colors.white,
        ),
      ),
      SizedBox(width: ScreenUtil().setWidth(22.0))
    ],
      ),
      body: SingleChildScrollView(
    padding: EdgeInsets.symmetric(vertical:ScreenUtil().setWidth(20.0)),
    child:Column( 
      children:[
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: ScreenUtil().setHeight(5)),
        itemBuilder: (BuildContext context, int index) {
          return FleetCard(carName: 'Mercedes S-Klasse',image: 'assets/blackcar@3x.png',capacity: '3 Passagiere',luggage: '2 Passagiere Inklusive Wasser (33 cl) Zuschlag 20.-*');
        },
        itemCount: 3),
      ]
      )),
    );
  }
}