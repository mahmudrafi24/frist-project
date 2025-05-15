import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Reset_Password/reset_password.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';
import 'controller/otp_controller.dart';

class OtpAuthentication extends StatefulWidget {
  final String? email;
  const OtpAuthentication({super.key,  this.email});

  @override
  State<OtpAuthentication> createState() => _OtpAuthenticationState();
}

class _OtpAuthenticationState extends State<OtpAuthentication> {
  final OtpController _otpController = Get.put(OtpController());

  @override
  void initState() {
    super.initState();
    _otpController.updateEmail(widget.email!);
  }
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
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: "OTP for Confirm Account",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: "${AppString.authCodesent} ${_otpController.email}",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black800,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 24.h),

              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.black400,
                showFieldAsBox: true,
                focusedBorderColor: AppColors.black400,
                borderRadius: BorderRadius.circular(4),
                enabledBorderColor: AppColors.otpBoxColor,
                fieldWidth: 40,
                margin: const EdgeInsets.only(left: 20),
                onSubmit: _otpController.updateOtpCode,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 16.h),
              Row(
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
              SizedBox(height: 20.h),
              CustomButton(
                textColor: AppColors.white300,
                onTap: () async {
                  await _otpController.verifyOtpCode();
                  if (_otpController.isValid) {
                    Get.offAll(() => ResetPassword(token: _otpController.token));
                  } else {
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
    );;
  }
}
