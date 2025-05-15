import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/CustomTextField/custome_text_field.dart';
import '../OTP/otp_authentication.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String? email;
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  ForgotPasswordPage({super.key,  this.email}); 
  @override
  Widget build(BuildContext context) {
    controller.emailController.text = email!; 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(
          text: AppString.logo,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primary700,
        ),
        titleSpacing: -7,
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: AppString.passwordRecovery,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: "${AppString.putInformationtoSignin} $email", // Display passed email
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black800,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 28.h),

              /// **Email Input Field**
              CustomTextField(
                textEditingController: controller.emailController,
                labelText: AppString.email,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 4,
                hintText: AppString.email,
                fieldBorderColor: AppColors.black400,
                height: 56.h,
              ),
              SizedBox(height: 28.h),

              /// **Send Reset Code Button**
              Obx(
                    () => CustomButton(
                  textColor: AppColors.black50,
                  onTap: controller.isLoading.value
                      ? () {}
                      : () async {
                    bool success = await controller.forgotPassword();
                    if (success) {
                      Get.to(() => OtpAuthentication(email: controller.emailController.text,)); // Navigate to OTP screen
                    }
                  },
                  title: controller.isLoading.value ? "Sending..." : AppString.sendcode,
                  fillColor: AppColors.primary700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
