import 'dart:async';

import 'package:flutter/material.dart';
import 'package:screen_recorder_app/Screens/App_Launch.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => App_Launch(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // color: Color.fromARGB(255, 156, 85, 231),
          child: Column(
            children: [
              Container(
                height: 250,
                // color: Colors.yellow,
                padding: const EdgeInsets.only(top: 150),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Screen Recorder",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //  color: Colors.orange,
                //width: 400,
                height: 400,
                child: Image.asset(
                  'assets/circles.png',
                  fit: BoxFit.fitWidth,
                  width: 500,
                  height: 700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                    height: 10), // Optional spacing between text1 and text2
                Text(
                  'Apps AiT',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ]),

      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     //color: Color.fromARGB(255, 156, 85, 231),
      //     height: 60,
      //     padding: const EdgeInsets.symmetric(vertical: 8),
      //     child: const Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           "Powered by",
      //           style: TextStyle(fontSize: 14, color: Colors.white),
      //         ),
      //         Text(
      //           "Apps AiT",
      //           style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
