import 'package:flutter/material.dart';
import 'package:sias/screens/login_screen.dart';
import 'package:sias/screens/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    width: 500, // Set your desired width
                    height: 400, // Set your desired height
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFD9B16D), Color(0xFF434E6E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(250), // Half of the width
                        bottomRight: Radius.circular(250), // Half of the width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(250), // Half of the width
                        bottomRight: Radius.circular(250), // Half of the width
                      ),
                      child: Image.asset(
                        'lib/images/onboard.png', // Replace with your image path
                        width: 500, // Set the same width as the container
                        height: 400, // Set the same height as the container
                        fit: BoxFit.cover,
                        // Half of the width
                      ),
                    ),
                  ),
                ), // Adjust the fit based on your needs

                SizedBox(height: 12), // Adjust spacing

                // Text: "Welcome to"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter', // Replace with your font family
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF434E6E),
                      ),
                    ),
                    // Adjust spacing
                    // Logo Image
                    Image.asset(
                      'lib/images/logo.png', // Replace with your logo image path
                      width: 98, // Set your desired width
                      height: 48, // Set your desired height
                    ),
                  ],
                ),
                SizedBox(height: 15), // Adjust spacing

                // Text: Long description
                Padding(
                  padding: const EdgeInsets.only(left: 57, right: 57),
                  child: Text(
                    "In the vast tapestry of humanity, your story is woven alongside countless others. You are not alone in your experiences. Even in the depths of despair, there is someone willing to listen, to care, to remind you that you are not alone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter', // Replace with your font family
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF434E6E),
                    ),
                  ),
                ),
                SizedBox(height: 15), // Adjust spacing

                // Join Now Button with Linear Gradient Background
                Container(
                  width: 183,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [Color(0xFF434E6E), Color(0xFFC85C46)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(
                      width: 0.5,
                      color: Color(0xFFD9B16D),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SignupPage(), // Navigate to the JoinNowScreen
    ),
  );
                    // Handle Login button click
                  },
                    child: Text(
                      "Join Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter', // Replace with your font family
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20), // Adjust spacing

                // Login Button
                ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => LoginScreen(), // Navigate to the JoinNowScreen
    ),
  );
                    // Handle Login button click
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xFF434E6E),
                    minimumSize: Size(183, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        width: 0.5,
                        color: Color(0xFFD9B16D),
                      ),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter', // Replace with your font family
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF434E6E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
