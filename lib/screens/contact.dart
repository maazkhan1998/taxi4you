import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiforyou/widgets/customtextfield.dart';
import 'package:taxiforyou/widgets/messagefield.dart';

class ContactScr extends StatefulWidget {
  @override
  _ContactScrState createState() => _ContactScrState();
}

class _ContactScrState extends State<ContactScr> {
  Position currentLocation;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currloc) {
      currentLocation = currloc;
    });
  }

  contactItem(String image, String text) {
    return Row(
      children: [
        Container(
          height: ScreenUtil().setHeight(35.0),
          width: ScreenUtil().setWidth(35.0),
          child: Image.asset(image),
        ),
        SizedBox(width: ScreenUtil().setWidth(12.0)),
        Expanded(
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'medium',
                  letterSpacing: -0.5,
                  fontSize: ScreenUtil().setSp(16.0),
                  color: Colors.black45)),
        )
      ],
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController message = TextEditingController();

  _writeUs() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Color(0xFFdedede),
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
            titlePadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            title: Text('Write Us',
                style: TextStyle(
                    fontFamily: 'medium',fontWeight: FontWeight.bold,letterSpacing: -0.5,
                    fontSize: ScreenUtil().setSp(20.0),
                    color: Colors.black54)),
            children: [
              SizedBox(height: ScreenUtil().setHeight(3.0)),
              CustomTextField(
                  hint: 'Ihr Name',
                  inputType: TextInputType.text,
                  controller: name),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Ihr E-Mail',
                  inputType: TextInputType.emailAddress,
                  controller: email),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Phone',
                  inputType: TextInputType.number,
                  controller: number),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              MessageField(
                  hint: 'Nachricht eingeben',
                  inputType: TextInputType.text,
                  controller: message,
              ),
              SizedBox(height: ScreenUtil().setHeight(28.0)),
              Container(
                height: ScreenUtil().setHeight(40.0),
                child: ElevatedButton(
                  child: Text('SEND',
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 12.5,letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8))),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.5, primary: Colors.teal.shade400 ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20.0),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              top: ScreenUtil().statusBarHeight,
              right: 30.0,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/search.png',
                  height: 16.0,
                  width: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: ScreenUtil().statusBarHeight,
              left: 30.0,
              child: IconButton(
                  icon: Image.asset(
                    'assets/arrow back.png',
                    height: 16.0,
                    width: 18.0,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: ScreenUtil().setHeight(300.0),
                width: ScreenUtil().screenWidth - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 10.0)
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kontakt',
                        style: TextStyle(
                            fontFamily: 'medium',
                            letterSpacing: -0.5,
                            fontSize: ScreenUtil().setSp(20.0),
                            color: Colors.black54)),
                    SizedBox(
                      height: ScreenUtil().setHeight(15.0),
                    ),
                    contactItem('assets/Group 2@3x.png','Ettenhauserstrasse 46 8620 Wetzikon ZH'),
                    SizedBox(
                      height: ScreenUtil().setHeight(8.0),
                    ),
                    contactItem('assets/Group 3@3x.png','+41 79 920 70 70'),
                    SizedBox(
                      height: ScreenUtil().setHeight(8.0),
                    ),
                    contactItem('assets/Group 4@3x.png','+41 79 920 70 70'),
                    SizedBox(
                      height: ScreenUtil().setHeight(10.0),
                    ),
                    contactItem('assets/Group 5@3x.png','info@taxiforyou.ch'),
                    SizedBox(
                      height: ScreenUtil().setHeight(15.0),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(32.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('WRITE US',
                            style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.8))),
                        style: ElevatedButton.styleFrom(
                            elevation: 0.5, primary: Colors.teal.shade400),
                        onPressed: _writeUs,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}