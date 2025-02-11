import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/otp_confirmation/controller/otp_controller.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';
import '../reset_password.dart';

class RegisterOtpConsfirmScreen extends StatefulWidget {
  const RegisterOtpConsfirmScreen({super.key});

  @override
  State<RegisterOtpConsfirmScreen> createState() =>
      _RegisterOtpConsfirmScreenState();
}

class _RegisterOtpConsfirmScreenState extends State<RegisterOtpConsfirmScreen> {
  OtpController _otpController = Get.put(OtpController());
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
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: "OTP of Confirm Account",
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
                text: AppString.authCodesent,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black800,
                textAlign: TextAlign.start,
                maxLines: 2,

              ),
              SizedBox(
                height: 24.h,
              ),

              /// OTP Box
              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.black400,
                showFieldAsBox: true,
                focusedBorderColor: AppColors.black400,
                borderRadius: BorderRadius.circular(4),
                enabledBorderColor: AppColors.otpBoxColor,
                fieldWidth: 40,
                margin: EdgeInsets.only(left: 20),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                onSubmit: (value) {
                  _otpController.updateOtpCode(value);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppString.dontreceived,
                    color: AppColors.black400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: AppString.resend,
                      color: AppColors.blue500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                textColor: AppColors.white300,
                onTap: () async {
                  await _otpController.verifyOtpCode();
                  if (_otpController.isValid) {
                    // OTP code is valid, proceed to next step
                    Get.to(() => LoginPage());
                  } else {
                    // OTP code is invalid, show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid OTP code')),
                    );
                  }
                },
                title: AppString.verify,
                fillColor: AppColors.primary700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
