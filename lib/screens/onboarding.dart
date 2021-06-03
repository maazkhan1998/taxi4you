import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:taxiforyou/screens/home.dart';
import 'package:taxiforyou/utils/SizeConfig.dart';

class OnBoardingScr extends StatefulWidget {
  const OnBoardingScr({Key key}) : super(key: key);

  @override
  _OnBoardingScrState createState() => _OnBoardingScrState();
}

class _OnBoardingScrState extends State<OnBoardingScr> {
  ScrollController controller;

  Widget renderNextBtn() {
    return Image.asset('assets/arrow.png');
  }

  List<String> assetList = [
    'assets/Phone Left@3x.png',
    'assets/Phone Medium@3x.png',
    'assets/Phone Right@3x.png'
  ];

  List<String> descList = [
    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei',
    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei',
    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei'
  ];

  introPage(String img, String descr, int index) {
    return Center(child: Image.asset(img));
  }

  int _currentPage = 0;
  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  initState() {
    controller = ScrollController();
    super.initState();
  }

  double position = 0;

  Widget _indicator(bool isActive) {
    return isActive
        ? AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: ScreenUtil().setHeight(18),
            width: ScreenUtil().setWidth(18),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent.withOpacity(0),
                border: Border.all(color: Colors.white38, width: 2)),
            child: Container(
              height: ScreenUtil().setHeight(9),
              width: ScreenUtil().setWidth(9),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: ScreenUtil().setHeight(8.0),
            width: ScreenUtil().setWidth(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(120),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: Colors.teal[500].withOpacity(1),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScr())),
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(34.0),
                    top: ScreenUtil().setHeight(34.0)),
                child: Text(
                  'SKIP',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'medium',
                      color: Colors.white.withOpacity(0.7),
                      fontSize: ScreenUtil().setHeight(12.0)),
                )),
          ),
          Expanded(
            child: ScrollSnapList(
              listController: controller,
              scrollDirection: Axis.horizontal,
              updateOnScroll: true,
              itemBuilder: (context, i) => introPage(assetList[i], 'descr', i),
              onItemFocus: (i) {
                if (i < _currentPage) position -= 200;
                setState(() => _currentPage = i);
              },
              itemCount: assetList.length,
              itemSize: ScreenUtil().setWidth(240),
              padding: EdgeInsets.all(0),
              duration: 300,
              curve: Curves.easeInOut,
              margin: EdgeInsets.all(0),
            ),
          ),
          // Expanded(
          //     child: PageView.builder(
          //   controller: controller,
          //   itemCount: 3,
          //   onPageChanged: (int page) {
          //     setState(() {
          //       _currentPage = page;
          //     });
          //   },
          //   scrollDirection: Axis.horizontal,
          //   physics: ClampingScrollPhysics(),
          //   itemBuilder: (context, i) => introPage(
          //       assetList[i],
          //       'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei',
          //       i),
          // )),
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Text(
                descList[_currentPage],
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.6,
                  fontFamily: 'roman',
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                  fontSize: 14.0,
                ),
              )),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            height: ScreenUtil().setHeight(80.0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: _buildPageIndicatorStatic(),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => HomeScr())),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0)),
                      height: ScreenUtil().setHeight(54.0),
                      width: ScreenUtil().setWidth(85.0),
                      child: Image.asset(
                        'assets/arrow.png',
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
