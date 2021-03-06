import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxiforyou/provider/bottomBarProvider.dart';
import 'package:taxiforyou/screens/contact.dart';
import 'package:taxiforyou/screens/ourfleet.dart';
import 'package:taxiforyou/screens/videos.dart';
import 'package:taxiforyou/widgets/dialogs.dart';
import 'homeView.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  List<String> icons = [
    'assets/outlined-ui-home@3x.png',
    '',
    'assets/play@3x.png',
    'assets/account@3x.png'
  ];

  List<String> titles = ['Homepage', 'Service', 'Video', 'Contact Us'];

  int _bottomNavIndex = 0;

  Widget _openSelectedPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return OurFleetScr();
      case 2:
        return VideosScr();
      case 3:
        return ContactScr();
      case 4:
        return VideosScr();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomProvider=Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _openSelectedPage(bottomProvider.pageNo),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (index, isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(index==0||index==4)
              ImageIcon(
                AssetImage(icons[0]),
                color:Colors.black,
              ),
              if(index==1)
              Icon(
                FontAwesomeIcons.car,
                color:  Colors.black,
              ),
              if(index==2)
              ImageIcon(
                AssetImage(icons[2]),
                color: Colors.black,
              ),
              if(index==3)
              Icon(
                Icons.phone,color: Colors.black
              ),
              SizedBox(height: ScreenUtil().setHeight(4.0)),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(8.0)),
                child: Text(
                  titles[index],
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(10.0)),
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
        onTap: (index) {
          Provider.of<BottomBarProvider>(context,listen: false).updatePageNo(index);
        },
        //other params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => bookNow(context),
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Calculator',
        child: Image.asset(
          'assets/calculator@3x.png',
          height: ScreenUtil().setHeight(22.0),
          width: ScreenUtil().setWidth(22.0),
          color: Colors.white,
        ),
        elevation: 1.0,
      ),
    );
  }
}
