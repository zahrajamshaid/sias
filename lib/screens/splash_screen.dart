import 'package:flutter/material.dart';
import 'package:sias/screens/splash2_screen..dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before navigating to the main screen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SplashScreen2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white, // Set your desired background color
      body: Center(
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
                color: Color(0xFF407770), // Text color
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}