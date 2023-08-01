import 'package:flutter/material.dart';

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
                    //Color.fromARGB(255, 238, 84, 73),
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
