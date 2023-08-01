import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:screen_recorder_app/Screens/notification_Screen.dart';

class App_Launch extends StatefulWidget {
  const App_Launch({super.key});

  @override
  State<App_Launch> createState() => _App_LaunchState();
}

class _App_LaunchState extends State<App_Launch> {
  double percent = 0.0;
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Notification_Screen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple[100],
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff322A5E), Colors.purple],
              stops: [0.7, 1],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        Container(
          width: 900,
          height: 700,
          child: Image.asset(
            'assets/circles.png',
            fit: BoxFit.fitWidth,
            width: 500,
            height: 700,
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(9, 600, 9, 8),
                child: const Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.black,
                    //fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Spacer(),
              Container(
                padding: EdgeInsets.fromLTRB(9, 0, 9, 8),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000, //milliseconds
                  lineHeight: 35.0,
                  //width: 343.0,
                  barRadius: const Radius.circular(9),
                  percent: 1,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                ),
              ),
              Spacer(),
              Container(
                height: 80,
                child: Image.asset(
                  'assets/Group 8939.png', // Replace with the path to your image
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
