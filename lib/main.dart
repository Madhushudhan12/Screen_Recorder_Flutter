import 'package:flutter/material.dart';
// import 'package:screen_recorder_app/Screens/App_Launch.dart';
// import 'package:screen_recorder_app/Screens/Home/Home_Screen.dart';
// import 'package:screen_recorder_app/Screens/notification_Screen.dart';
import 'package:screen_recorder_app/Screens/splash_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Splash_Screen(),
      //home: Home_Screen(),
      //home: Notification_Screen(),
    );
  }
}
