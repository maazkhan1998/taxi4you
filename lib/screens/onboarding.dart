import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScr extends StatefulWidget {
  const OnBoardingScr({Key key}) : super(key: key);

  @override
  _OnBoardingScrState createState() => _OnBoardingScrState();
}

class _OnBoardingScrState extends State<OnBoardingScr> {
  // List<Slide> slides = [];

  // Function goToTab;

  // @override
  // void initState() {
  //   super.initState();

  //   slides.add(
  //     new Slide(
  //       title: 'skip',
  //       widgetTitle: Text('skip'),
  //       description:
  //           "Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei",
  //       styleDescription:
  //           TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14.0, letterSpacing: 0.4),
  //       pathImage: "assets/Phone Left.png",
  //     ),
  //   );
  //   slides.add(
  //     new Slide(
  //       description:
  //           "Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei",
  //       styleDescription:
  //           TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14.0, letterSpacing: 0.4),
  //       pathImage: "assets/Phone Medium.png",
  //     ),
  //   );
  //   slides.add(
  //     new Slide(
  //       description:
  //           "Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei",
  //       styleDescription:
  //           TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14.0, letterSpacing: 0.4),
  //       pathImage: "assets/Phone Right.png",
  //     ),
  //   );
  // }

  Widget renderNextBtn() {
    return Image.asset('assets/arrow.png');
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  introPage(String img, String descr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img, scale: 1.3),
        SizedBox(
          height: ScreenUtil().setHeight(20.0),
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              descr,
              textAlign: TextAlign.left,
              style: TextStyle(
                height: 1.4,
                fontFamily: 'roman',
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold,letterSpacing: 0.4,
                fontSize: 14.0,
              ),
            ))
      ],
    );
  }

  int _currentPage=0;
  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return isActive?
    AnimatedContainer(
      duration: Duration(milliseconds: 300),
       curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 20,width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent.withOpacity(0),
        border: Border.all(
          color:Colors.white54,width: 2
        )
      ),
      child: Container(
        height: 12,width:12,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
      ),
    )
    :AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height:  8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha(120),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[500].withOpacity(1),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 35.0, top: 20.0),
                  child: Text(
                    'SKIP',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'medium',
                      color: Colors.white.withOpacity(0.7),fontSize: 12.0),
                  )),
            ),
            SizedBox(height:20.0),
            Container(
              height: ScreenUtil().setHeight(500.0),
                child: PageView(
                  onPageChanged: (int page){
                    setState(() {
                      _currentPage=page;
                    });
                  },
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              children: [
                introPage('assets/Phone Left.png',
                    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei'),
                introPage('assets/Phone Medium.png',
                    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei'),
                introPage('assets/Phone Right.png',
                    'Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei'),
              ],
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
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
                      color:Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.0)
                    ),
                    height: ScreenUtil().setHeight(55.0),
                    width: ScreenUtil().setWidth(85.0),
                    child: Image.asset('assets/arrow.png',)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
