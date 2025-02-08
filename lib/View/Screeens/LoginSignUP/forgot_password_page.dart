import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/otp_authentication.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../Widgets/Custom_Button/custom_button.dart';
import '../../Widgets/CustomTextField/custome_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(
          text: AppString.logo,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.primary700,
        ),
        titleSpacing: -7,
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: AppString.passwordRecovery,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: AppString.putInformationtoSignin,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black800,
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomTextField(
                labelText: AppString.name,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 4,
                hintText: AppString.name,
                fieldBorderColor: AppColors.black400,
                height: 56,
              ),
              SizedBox(
                height: 28.h,
              ),

              /// Create Account Button
              CustomButton(
                textColor: AppColors.black50,
                onTap: () {
                  Get.to(OtpAuthentication());
                },
                title: AppString.sendcode,
                fillColor: AppColors.primary700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
