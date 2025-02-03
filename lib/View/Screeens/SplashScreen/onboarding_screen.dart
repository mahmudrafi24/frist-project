import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/login_signup_onboarding.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/AppColors/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    AppImages.onboardingImage01,
    AppImages.onboardingImage02,
    AppImages.onboardingImage03,
  ];

  void _nextPage() async {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to home page
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_complete', true);
      Get.to(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300.h,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white600,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white100.withOpacity(0.7),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: CustomText(
                      text: AppString.theImportantofNursing,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black800,
                    ),
                  ),
                  SizedBox(height: 31.h),
                  CustomText(
                    text: AppString.paragraph,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.black800,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onTap: () {},
                        title: "Skip",
                        textColor: AppColors.black800,
                        height: 36.h,
                        width: 100.w,
                        fillColor: AppColors.white100,
                      ),
                      CustomButton(
                          onTap: _nextPage,
                          title: _currentPage == 2 ? "Finish" : "Next",
                          height: 36.h,
                          width: 100.w,
                          fillColor: AppColors.primary500,
                          textColor: AppColors.white300),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 32,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.black400
                              : AppColors.white800,
                          borderRadius: BorderRadius.circular(4.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
