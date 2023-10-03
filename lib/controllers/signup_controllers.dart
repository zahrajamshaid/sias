import 'package:flutter/material.dart';

class UserController {
  static  TextEditingController uidController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();
  static final TextEditingController phoneNumberController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController idController = TextEditingController();
  static  TextEditingController locationController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController confirmPasswordController = TextEditingController(); // Add this controller
  
  // Dispose the controllers when they are no longer needed
  void dispose() {
    uidController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    idController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose(); // Dispose the confirmPasswordController
  }
}


