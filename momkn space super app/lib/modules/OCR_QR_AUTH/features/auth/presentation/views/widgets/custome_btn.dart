import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text, required this.func});

  final void Function()? func;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        // primary: Constants.primaryGreen, // background color
        backgroundColor: Constants.primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // adjust the value to your preference
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white,fontSize: 17),
      ),
    );
  }
}
