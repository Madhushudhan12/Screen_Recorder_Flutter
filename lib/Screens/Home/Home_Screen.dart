import 'package:flutter/material.dart';
import 'package:screen_recorder_app/Screens/common_widgets/BNB.dart';
import 'package:screen_recorder_app/Screens/common_widgets/Home_Rounded_Button.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          child: Column(children: [
        Container(
          height: 100,
          // color: Colors.yellow,
          //padding: const EdgeInsets.only(top: 150),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Screen Recorder",
                  style: TextStyle(
                    fontSize: 30,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MyRoundedButton(
                  title: 'HD-720P',
                  subtitle: 'Resolution',
                  onPressed: () => print('Resolution clicked!'),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: MyRoundedButton(
                  title: '3 Mbps',
                  subtitle: 'Bitrate',
                  onPressed: () => print('Bitrate clicked!'),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: MyRoundedButton(
                  title: '25 fps',
                  subtitle: 'Framerate',
                  onPressed: () => print('Framerate clicked!'),
                ),
              ),
            ],
          ),
        ),
        //const SizedBox(height: 18),
        Spacer(),
        const Text(
          "Tap to start recording",
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 80,
            child: Stack(
              // overflow: Overflow.visible,
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 149, 28, 190),
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                      elevation: 0.1,
                      onPressed: () {}),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.video_camera_back_outlined,
                            size: 40,
                            color: currentIndex == 1
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          }),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            size: 40,
                            color: currentIndex == 2
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ])),
    ]));
  }
}
