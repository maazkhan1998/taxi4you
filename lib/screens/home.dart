import 'package:flutter/material.dart';
import '../utils/SizeConfig.dart';

class HomeScr extends StatefulWidget {
  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: MySize.size34,
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w100),
            ),
            actions: [
              // IconButton(
              //   icon: Icon(Icons.search,size: 24.0,color: Colors.white.withOpacity(0.7)),
              //   onPressed: (){}
              // ),
              Image.asset(
                'assets/search.png',
                height: 16.0,
                width: 18.0,
                color: Colors.white.withOpacity(0.7),
              ),
              SizedBox(width: MySize.size24)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(elevation: 0.5,
          
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              
              ],
            ),
          )),
    );
  }
}
