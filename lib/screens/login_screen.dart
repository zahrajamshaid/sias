import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sias/controllers/login_controllers.dart';
import 'package:sias/custom_widgets/ellipse.dart';
import 'package:sias/custom_widgets/text_field.dart';
import 'package:sias/screens/forgot_password.dart';
import 'package:sias/screens/home_screen.dart';
import 'package:sias/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  Future<bool> loginUser(BuildContext context) async {
  try {
    final String email = emailLoginController.text.trim();
    final String password = passwordLoginController.text.trim();

    // Step 1: Authenticate the user with Firebase Authentication
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // Step 2: Check if the user's email and password exist in Firestore
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    final QuerySnapshot querySnapshot = await usersCollection
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    // Step 3: If a document with matching email and password is found, consider it a successful login
    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      // If no matching document is found, log out the user and return false
      await FirebaseAuth.instance.signOut();
      return false;
    }
  } catch (error) {
    // Handle login errors and show a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Error'),
          content: Text('There was an error during login. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    return false;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF434E6E),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            
            Positioned(
              top: -40,
              left: -25,
              child: Container(
                width: 150,
                height: 150.0,
                child: CustomPaint(
                  painter: EllipsePainter(
                    backgroundColor: Color(0xFFC85C46),
                    padding: 1.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: -40,
              child: Container(
                width: 150,
                height: 150.0,
                child: CustomPaint(
                  painter: EllipsePainter(
                    borderWidth: 23.0,
                    borderColor: Color(0xFFD9B16D),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
         Positioned(
              top: 125,
              right: -35,
              child: Container(
                width: 70,
                height: 70.0,
                child: CustomPaint(
                  painter: EllipsePainter(
                    borderWidth: 8.0,
                    borderColor: Color(0xFF407770),

                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
          
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(10),
                               
                              ),
                              child: Column(
                                children: <Widget>[
                                      Text(
  "Welcome Back!",
  style: TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto', // Replace with your desired font family
    fontWeight: FontWeight.w500,
    color: Color(0xFF434E6E),
 
  ),
),
SizedBox(height: 22,),
Text(
  "Login in with your credentials",
  style: TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto', // Replace with your desired font family
    fontWeight: FontWeight.w500,
    color: Color(0x80434E6E), // You might need to adjust the color format
   
  ),
),
SizedBox(height: 40,),

                CustomTextField(
  controller: emailLoginController, // Provide your TextEditingController for email
  hintText: "Email",
  
),
CustomTextField(
  controller: passwordLoginController, // Provide your TextEditingController for password
  hintText: "Password",
  obscureText: true,

)






                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Align(
  alignment: Alignment.centerRight, // Align to the right
    // Navigate to the desired page here
     
  child: GestureDetector(
          onTap: () {
            // Handle "Forgot Password?" click here
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPasswordPage(), // Replace with your page
        ),
      );
     // You can navigate to another page or show a dialog, for example.
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                    
                  ),
                ),
                // Icon(
                //   Icons.arrow_forward,
                //   color: Colors.black,
                // ),
              ],
            ),
          ),
  ), ),
  SizedBox(height: 40,),
   ElevatedButton(
 onPressed: () async {
  // Call the loginUser function
  final bool loginSuccessful = await loginUser(context);

  // Check if login was successful
  if (loginSuccessful) {
    // Navigate to the home screen or any other screen after successful login
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(), // Replace with your home screen
      ),
    );
  }
},
  style: ElevatedButton.styleFrom(
    primary: Colors.orange[900], // Button background color
    onPrimary: Colors.white, // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50), // Rounded border
    ),
  ),
  child: Container(
    height: 50,
    width: 170, // Make the button as wide as possible
    alignment: Alignment.center,
    child: Text(
      "Login",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
),






                           
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      "Don’t have an account? ",
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        color: Color(0xCC434E6E),
      ),
    ),
   MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Handle the tap gesture for "Signup" here
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPage(), // Replace with your Signup page
            ),
          );
        },
        child: Text(
          "Signup",
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Color(0xFFD9B16D),
          ),
        ),
      ),
    ),
  ],
),
                           
                          
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
