import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/onboarding.dart';
import 'screens/onboarding.dart';
import 'screens/videos.dart';
import 'screens/ourfleet.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Taxi For You',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xFF3DB1A2)),
        home: OnBoardingScr(),
      ),
    ); 
  }
}
