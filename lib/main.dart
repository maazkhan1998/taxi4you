import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taxiforyou/provider/bottomBarProvider.dart';
import 'screens/onboarding.dart';

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
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BottomBarProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Taxi4You',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color(0xFF3DB1A2)),
          home: OnBoardingScr(),
        ),
      ),
    );
  }
}
