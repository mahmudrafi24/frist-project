import 'dart:async';

import 'package:flutter/material.dart';

import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/View/Screeens/SplashScreen/onboarding_screen.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue500,
      body: Center(
        child: CustomText(
          text: "Logo",
          color: AppColors.white200,
          fontSize: 84,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
