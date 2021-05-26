import 'package:flutter/material.dart';
import 'package:taxiforyou/utils/SizeConfig.dart';

class OnBoardingScr extends StatefulWidget {
  const OnBoardingScr({Key key}) : super(key: key);

  @override
  _OnBoardingScrState createState() => _OnBoardingScrState();
}

class _OnBoardingScrState extends State<OnBoardingScr> {

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
          height: MySize.size20,
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: MySize.size30),
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
      height: MySize.size20,width: MySize.size20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent.withOpacity(0),
        border: Border.all(
          color:Colors.white54,width: 2
        )
      ),
      child: Container(
        height: MySize.size12,width:MySize.size12,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
      ),
    )
    :AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: MySize.size8),
      height:  MySize.size8,
      width: MySize.size8,
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
              onTap: (){},
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: MySize.size34, top: MySize.size20),
                  child: Text(
                    'SKIP',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'medium',
                      color: Colors.white.withOpacity(0.7),fontSize: 12.0),
                  )),
            ),
            SizedBox(height:MySize.size20),
            Container(
              height: MySize.getScaledSizeHeight(500),
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
              padding: EdgeInsets.symmetric(horizontal: MySize.size30),
              height: MySize.size80,
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
                    height: MySize.size54,
                    width: MySize.getScaledSizeWidth(85),
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
