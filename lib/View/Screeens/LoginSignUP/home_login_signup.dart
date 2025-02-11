import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/sign_up/sigin_up_page.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Image.asset(
            AppImages.loginImage,
            height: 350.h,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary500,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Logo",
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      maxLines: 2,
                      text:
                          "Empower Your Nursing Journey – Learn, Practice, Succeed",
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        height: 45.h,
                        width: 370.w,
                        fillColor: AppColors.white100,
                        title: "Login",
                        textColor: AppColors.black800),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomButton(
                        onTap: () {
                          Get.to(() => SiginUpPage());
                        },
                        height: 45.h,
                        width: 370.w,
                        fillColor: AppColors.white100,
                        title: "Create Account",
                        textColor: AppColors.black800),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
