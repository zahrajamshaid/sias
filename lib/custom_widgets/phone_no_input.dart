import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InternationalPhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<PhoneNumber>? onInputChanged;
  final String hintText;
  final bool obscureText;

  InternationalPhoneNumberField({
    required this.controller,
    required this.hintText,
    this.onInputChanged,
    this.obscureText = false,
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
      child: InternationalPhoneNumberInput(
        onInputChanged: onInputChanged,
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        textFieldController: controller,
        keyboardType: TextInputType.number, // Allow only numbers
        formatInput: true, // Format the input as the user types
        inputDecoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}