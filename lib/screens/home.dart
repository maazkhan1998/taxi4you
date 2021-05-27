import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/screens/contact.dart';
import 'package:taxiforyou/screens/ourfleet.dart';
import 'package:taxiforyou/widgets/dialogs.dart';
import 'homeView.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {

  List<String> icons = [
   'assets/outlined-ui-home@2x.png',
   'assets/clipboard@3x.png',
   'assets/date@3x.png',
   'assets/account@3x.png'
  ];

  List<String> titles=[
    'Homepage',
    'Works',
    'Calendar',
    'Contact Us'
  ];

 

  int _bottomNavIndex=0;

  Widget _openSelectedPage() {
    switch(_bottomNavIndex) {
      case 0:
        return HomeView();
      case 1:
        return OurFleetScr();
      case 2:
        return Center(child:Text('Calendar'));
      case 3:
        return ContactScr();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _openSelectedPage(),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
      itemCount: 4,
      tabBuilder: (index,isActive){
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           ImageIcon(
     AssetImage(icons[index]),
     color:isActive?Color(0xFF3DB1A2): Colors.black,
),
SizedBox(height: 4),
Padding(
  padding: EdgeInsets.only(left:8),
  child:   Text(
  
                      titles[index],
  
                      maxLines: 1,
  
                      style: TextStyle(color: isActive?Color(0xFF3DB1A2): Colors.black,fontSize: 12),
  
                    ),
)
          ],
        );
      },
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      //other params
   ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed:()=> bookNow(context),
          backgroundColor: Theme.of(context).primaryColor,
          tooltip: 'Calculator',
          child: Image.asset(
            'assets/calculator.png',
            height: ScreenUtil().setHeight(22.0),
            width: ScreenUtil().setWidth(22.0),
            color: Colors.white.withOpacity(0.8),
          ),
          elevation: 1.0,
        ),
      ),
    );
  }
}
