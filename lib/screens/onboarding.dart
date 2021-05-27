import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiforyou/screens/home.dart';
import 'package:taxiforyou/utils/SizeConfig.dart';

class OnBoardingScr extends StatefulWidget {
  const OnBoardingScr({Key key}) : super(key: key);

  @override
  _OnBoardingScrState createState() => _OnBoardingScrState();
}

class _OnBoardingScrState extends State<OnBoardingScr> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8);

  Widget renderNextBtn() {
    return Image.asset('assets/arrow.png');
  }

  List<String> assetList = [
    'assets/Phone Left.png',
    'assets/Phone Medium.png',
    'assets/Phone Right.png'
  ];

  introPage(String img, String descr, int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1);
        }
        return new SizedBox(
          height: Curves.easeIn.transform(value) * ScreenUtil().setHeight(500),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img, height: MySize.getScaledSizeHeight(400)),
          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          Container(
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child: Text(
                descr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.6,
                  fontFamily: 'roman',
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                  fontSize: 14.0,
                ),
              ))
        ],
      ),
    );
  }

  int _currentPage = 0;
  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return isActive
        ? AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: ScreenUtil().setHeight(20.0),
            width: ScreenUtil().setWidth(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent.withOpacity(0),
                border: Border.all(color: Colors.white54, width: 2)),
            child: Container(
              height: ScreenUtil().setHeight(12.0),
              width: ScreenUtil().setWidth(12.0),
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
    return SafeArea(
      child: Scaffold(
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
                  margin: EdgeInsets.only(right: 34.0, top: 20.0),
                  child: Text(
                    'SKIP',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'medium',
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12.0),
                  )),
            ),
            SizedBox(height: MySize.getScaledSizeHeight(80)),
            Expanded(
                child: PageView.builder(
              controller: controller,
              itemCount: 3,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, i) => introPage(
                  assetList[i],
                  'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei',
                  i),
            )),
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              height: ScreenUtil().setHeight(80.0),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: _buildPageIndicatorStatic(),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50.0)),
                      height: ScreenUtil().setHeight(54.0),
                      width: ScreenUtil().setWidth(85.0),
                      child: Image.asset(
                        'assets/arrow.png',
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
