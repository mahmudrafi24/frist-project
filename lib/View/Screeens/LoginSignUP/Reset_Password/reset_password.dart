import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';
import '../../../Widgets/CustomTextField/custome_text_field.dart';
import 'controller/reset_password_controller.dart';

class ResetPassword extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  final String? token; // Receive token from OTP Verification
  ResetPassword({super.key,  this.token}) {
    controller.setToken(token!); // Pass token to controller
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
                text: AppString.resetPass,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: AppString.createnewPass,
                fontSize: 12.sp,
                color: AppColors.black400,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              SizedBox(height: 28.h),

              /// **New Password Input Field**
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      textEditingController: controller.newPasswordController,
                      labelText: AppString.createPass,
                      keyboardType: TextInputType.visiblePassword,
                      borderRadius: 4,
                      hintText: AppString.createPass,
                      fieldBorderColor: AppColors.black400,
                      isPassword: true, //  Ensure password stays hidden
                      onChanged: (value) {
                        controller.validatePassword();
                        controller.validateConfirmPassword(); //  Revalidate confirm password
                      },
                    ),
                    if (controller.passwordError.value.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomText(
                          text: controller.passwordError.value,
                          fontSize: 12.sp,
                          color: AppColors.red600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 17.h),

              /// **Confirm Password Input Field**
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      textEditingController: controller.confirmPasswordController,
                      labelText: AppString.confirmpass,
                      keyboardType: TextInputType.visiblePassword,
                      borderRadius: 4,
                      hintText: AppString.confirmpass,
                      fieldBorderColor: AppColors.black400,
                      isPassword: true, //  Ensure password stays hidden
                      onChanged: (value) {
                        controller.validateConfirmPassword();
                      },
                    ),
                    if (controller.confirmPasswordError.value.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CustomText(
                          text: controller.confirmPasswordError.value,
                          fontSize: 12.sp,
                          color: AppColors.red600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),

              CustomText(
                text: AppString.use8char,
                fontSize: 12.sp,
                color: AppColors.black400,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 28.h),

              /// **Change Password Button**
              Obx(
                    () => CustomButton(
                  onTap: controller.isLoading.value || controller.confirmPasswordError.value.isNotEmpty
                      ? (){} //  Disable button if there are errors
                      : () async {
                    bool success = await controller.resetPassword();
                    if (success) {
                      Get.offAll(() => LoginPage()); //  Navigate to Login Page after success
                    }
                  },
                  title: controller.isLoading.value ? "Updating..." : AppString.changepass,
                  fillColor: controller.isLoading.value || controller.confirmPasswordError.value.isNotEmpty
                      ? AppColors.black400 // Disabled button color
                      : AppColors.primary700,
                  textColor: AppColors.white300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
