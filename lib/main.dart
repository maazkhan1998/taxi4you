import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/onboarding.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Taxi For You',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF3DB1A2)),
        home: HomeScr(),
      ),
    );
  }
}
