import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sias/controllers/signup_controllers.dart';
import 'package:sias/custom_widgets/ellipse.dart';
import 'package:sias/custom_widgets/phone_no_input.dart';
import 'package:sias/custom_widgets/text_field.dart';
import 'package:sias/models/user.dart';
import 'package:sias/screens/forgot_password.dart';
import 'package:sias/screens/home_screen.dart';
import 'package:sias/screens/signup_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool passwordsMatch = true;
  bool registerationSuccessful = true;
  final _auth = FirebaseAuth.instance;
//  UserModel newUser = UserModel(
//     uid: '',
//     username: '',
//     phoneNumber: '',
//     email: '',
//     id: '',
//     location: '',
//     password: '',
//   );
 void register() async {
  final String email = UserController.emailController.text.trim();
  final String password = UserController.passwordController.text.trim();

  // Show the loading indicator while registering
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog with a tap outside
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final UserModel newUser = UserModel(
      uid: userCredential.user!.uid,
      username: email,
      phoneNumber: UserController.phoneNumberController.text.trim(),
      email: email,
      id: UserController.idController.text.trim(),
      location: UserController.locationController.text.trim(),
      password: password,
    );

    // Store user information in Firestore
    await FirebaseFirestore.instance
        .collection("users")
        .doc(newUser.uid)
        .set(newUser.toJson());

    // Registration successful, update the state or show a success message
    setState(() {
      registerationSuccessful = true;
    });

    // Close the loading indicator dialog
    Navigator.pop(context);

    // Show a success message and navigate to the HomeScreen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You have successfully registered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(), // Navigate to HomeScreen
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (error) {
    // Registration failed, log the error and set registrationSuccessful to false
    print("Registration error: $error");
    setState(() {
      registerationSuccessful = false;
    });

    // Close the loading indicator dialog
    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Failed'),
          content: Text('Registration failed. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextField(
                                    controller: UserController
                                        .usernameController, // Use userController here
                                    hintText: "Enter Username",
                                  
                                  ),
                                  InternationalPhoneNumberField(
  controller: UserController.phoneNumberController,
  hintText: "Enter Phone Number",
  
),

                                  CustomTextField(
                                    controller: UserController.emailController,
                                    hintText: "Enter Email Id",
                                    
                                  ),
                                  CustomTextField(
                                    controller: UserController.idController,
                                    hintText: "Enter ID",
                                    
                                  ),
                                  CustomTextField(
                                    controller:
                                        UserController.locationController,
                                    hintText: "Enter Location",
                                   
                                  ),
                                  CustomTextField(
                                    controller:
                                        UserController.passwordController,
                                    hintText: "Enter Password",
                                    obscureText: true,
                                    // onChanged: (value) {
                                    //   newUser.password =
                                    //       value; // Update the password in the User model
                                    // },
                                  ),
                                  CustomTextField(
                                    controller: UserController
                                        .confirmPasswordController,
                                    hintText: "Confirm Password",
                                    obscureText: true,
                                  //   onChanged: (value) {
                                  //     // Handle onChanged for confirmPassword and check if it matches the password
                                  //     if (value == newUser.password) {
                                  //       passwordsMatch = true;
                                  //       // Passwords match
                                  //       // You can set a flag or handle the confirmation logic here
                                  //     } else {
                                  //       passwordsMatch = false;
                                  //       // Passwords do not match
                                  //       // You can set a flag or display an error message here
                                  //     }
                                  //   },
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF434E6E),
                                          Color(0xFFC85C46)
                                        ],
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
                                        register();
                                        // if (registerationSuccessful == true) {
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         HomeScreen(), // Navigate to the JoinNowScreen
                                        //   ),
                                        // );
                                        // }
                                        // Handle Get Started button click
                                      },
                                      child: Text(
                                        "Get Started",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:
                                              'Inter', // Replace with your font family
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
