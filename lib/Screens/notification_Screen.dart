import 'package:flutter/material.dart';
import 'package:screen_recorder_app/Screens/Notification/Home_Back_Screen.dart';
//import 'dart:ui' as ui;

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Use the blurred home screen as the background
          Container(
            color: Colors.amber,
            child: HomeScreen(),
          ),
          // Add the notification allowance popup
          Center(
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/notification_icon.png', height: 60),
                    const SizedBox(height: 16),
                    const Text(
                      "Allow Notification Panel?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Column(
                      children: [
                        Text(
                          "Allow notification control panel to appear",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "to strengthen recording and",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "ensure normal recording.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        GradientButton(
                          text: "Allow",
                          onPressed: () => _onAllowPressed(context),
                        ),
                        const SizedBox(height: 16),
                        GradientButton(
                          text: "Don't Allow",
                          onPressed: () => _onDontAllowPressed(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) => print("Checkbox changed!"),
                        ),
                        const Text("Don't ask again"),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _onAllowPressed(BuildContext context) {
    // Push the HomeScreen onto the navigation stack
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _onDontAllowPressed() {
    print("Don't Allow pressed!");
    // Add your logic for handling the "Don't Allow" button press here
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 215, 89, 145),
              Color.fromARGB(255, 106, 6, 123)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
