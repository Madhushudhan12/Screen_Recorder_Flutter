import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: Color(0xffbfbfbf),
      body: Stack(
        children: [
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
          // Add a blurred overlay on top of the home screen
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: const Center(
                      child: Text(
                        "Screen Recorder",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
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
                  Spacer(),
                  const Text(
                    "Tap to start recording",
                    style: TextStyle(
                      fontSize: 20,
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
                        children: [
                          CustomPaint(
                            size: Size(size.width, 80),
                            painter: BNBCustomPainter(),
                          ),
                          Center(
                            heightFactor: 0.6,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 149, 28, 190),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyRoundedButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  MyRoundedButton({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xffE0E3E3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        side: const BorderSide(
          color: Colors.purple, // Border Color
          width: 4.0,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 215, 89, 145),
                    Color.fromARGB(255, 106, 6, 123)
                  ],
                ).createShader(bounds),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient colors
    const Gradient gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 109, 99, 165),
        Color.fromARGB(255, 198, 66, 222)
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    Paint paint = new Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
