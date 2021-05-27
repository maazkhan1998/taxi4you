import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/screens/contact.dart';
import '../widgets/customtextfield.dart';
import '../widgets/datetimefield.dart';
import '../widgets/locationfield.dart';
import '../widgets/messagefield.dart';
import '../widgets/FABAppBar.dart';
import '../utils/SizeConfig.dart';
import 'homeView.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController location2 = TextEditingController();
  TextEditingController date = TextEditingController();

  List<FABBottomAppBarItem> appbaritems = [
    FABBottomAppBarItem(text: 'Home', image: 'assets/outlined-ui-home@2x.png'),
    FABBottomAppBarItem(text: 'Works', image: 'assets/clipboard@3x.png'),
    FABBottomAppBarItem(text: 'Calendar', image: 'assets/date@3x.png'),
    FABBottomAppBarItem(text: 'Profile', image: 'assets/account@3x.png'),
  ];

  int _lastSelected = 0;

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  _getLocation() {}

  _bookNow() {
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
            titlePadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            title: Text('Jetzt Buchen',
                style: TextStyle(
                    fontFamily: 'medium',fontWeight: FontWeight.bold,letterSpacing: -0.5,
                    fontSize: ScreenUtil().setSp(20.0),
                    color: Colors.black54)),
            children: [
              SizedBox(height: ScreenUtil().setHeight(3.0)),
              CustomTextField(
                  hint: 'Name',
                  inputType: TextInputType.text,
                  controller: name),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Phone',
                  inputType: TextInputType.number,
                  controller: number),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              CustomTextField(
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  controller: email),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              LocationField(
                  hint: 'Abholort*',
                  inputType: TextInputType.text,
                  controller: location,
                  getlocation: _getLocation),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              LocationField(
                  hint: 'Ankunftsort*',
                  inputType: TextInputType.text,
                  controller: location2,
                  getlocation: _getLocation),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              DateTimeField(
                  hint: 'Datum/Uhrzeit*',
                  inputType: TextInputType.datetime,
                  controller: date),
              SizedBox(height: ScreenUtil().setHeight(28.0)),
              Container(
                height: ScreenUtil().setHeight(40.0),
                child: ElevatedButton(
                  child: Text('ANFRAGE ABSCHICKEN',
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8))),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.5, primary: Colors.teal.shade400),
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

  Widget _openSelectedPage() {
    switch(_lastSelected) {
      case 0:
        return HomeView();
      case 1:
        return HomeView();
      case 2:
        return ContactScr();
      case 3:
        return ContactScr();
    }
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
        body: _openSelectedPage(),
        bottomNavigationBar: FABBottomAppBar(
          height: ScreenUtil().setHeight(65.0),
          items: appbaritems,
          onTabSelected: _selectedTab,
          iconSize: 24.0,
          selectedColor: Theme.of(context).primaryColor,
          notchedShape: CircularNotchedRectangle(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _bookNow,
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
