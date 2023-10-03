import 'package:flutter/material.dart';
import 'package:sias/custom_widgets/ellipse.dart';
import 'package:sias/screens/onboarding_screen.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before navigating to the main screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Stack(
        children: [
          // Positioned ellipse 1
          Positioned(
            top: 54,
            left: -85,
            child: Container(
              width: 170,
              height: 170.0,
              child: CustomPaint(
                painter: EllipsePainter(
                  backgroundColor: Color(0xFFB38CB4),
                  padding: 1.0,
                ),
              ),
            ),
          ),
          // Positioned ellipse 2
          Positioned(
            top: 20,
            left: -85,
            child: Container(
              width: 170,
              height: 170.0,
              child: CustomPaint(
                painter: EllipsePainter(
                  borderWidth: 10.0,
                  borderColor: Color(0xFF503C7C),

                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 54,
            right: -85,
            child: Container(
              width: 170,
              height: 170.0,
              child: CustomPaint(
                painter: EllipsePainter(
                  backgroundColor: Color(0xFFB38CB4),
                  padding: 1.0,
                ),
              ),
            ),
          ),
          // Positioned ellipse 2
          Positioned(
            bottom: 90,
            right: -85,
            child: Container(
              width: 170,
              height: 170.0,
              child: CustomPaint(
                painter: EllipsePainter(
                  borderWidth: 10.0,
                  borderColor: Color(0xFF148DB3),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
     
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your logo image here
                Image.asset(
                  'lib/images/logo.png', // Replace with your logo image path
                  width: 182.1875, // Set your desired width
                  height: 93.3125, // Set your desired height
                ),
                SizedBox(height: 7.69), // Adjust spacing between logo and text
                Text(
                  "SHE IS A SURVIVOR",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Make sure your font is correctly loaded
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF503C7C), // Text color
                  ),
                ),
                SizedBox(height: 20), // Adjust spacing between text and ellipses
              ],
            ),
          ),
        ],
      ),
    );
  }
}