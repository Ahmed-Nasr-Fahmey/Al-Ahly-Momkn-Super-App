import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      required this.controller,
      required this.icon});

  final String text;
  final TextEditingController? controller;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Constants.textFieldColor,
        // Grey background color
        hintText: text,
        hintStyle: const TextStyle(color: Constants.textFieldHintColor),
        // Darker grey hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), // Curved borders
          borderSide: BorderSide.none, // No border
        ),
        suffixIcon: icon, // Add the search icon
      ),
      style: const TextStyle(color: Colors.black), // Black text color when typing
    );
  }
}
