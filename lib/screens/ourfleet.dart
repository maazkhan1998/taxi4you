import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/fleetCard.dart';

class OurFleetScr extends StatefulWidget {
  @override
  _OurFleetScrState createState() => _OurFleetScrState();
}

class _OurFleetScrState extends State<OurFleetScr> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/arrow back.png',
              height: 16.0,
              width: 18.0,
            ),
            onPressed: () {}),
        title: Text(
          'Unsere Flotte',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white.withOpacity(0.8),
            fontFamily: 'heavy',
          ),
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
        padding: EdgeInsets.symmetric(vertical:20),
        child:Column( 
          children:[
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: ScreenUtil().setHeight(3.0)),
            itemBuilder: (BuildContext context, int index) {
              return FleetCard(carName: 'Mercedes S-Klasse',image: 'assets/blackcar.png',capacity: '3 Passagiere',luggage: '2 Passagiere Inklusive Wasser (33 cl) Zuschlag 20.-*');
            },
            itemCount: 3),
          ]
      )),
    ));
  }
}