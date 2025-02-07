import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../Utils/AppColors/app_colors.dart';

class CustomPinput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Custom Pinput')),
      body: Center(
        child: Pinput(
          length: 4, // Number of input fields
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(
                  color: Colors.blue), // Change border color when focused
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(
                  color: AppColors
                      .primary100), // Change border color when submitted
            ),
          ),
        ),
      ),
    );
  }
}
