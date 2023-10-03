import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
 final bool obscureText;
  CustomTextField({
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller, // Pass the controller here
        onChanged: onChanged, // Pass the onChanged callback here
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
