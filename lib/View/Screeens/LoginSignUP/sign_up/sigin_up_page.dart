import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:frist_project/utils/AppColors/app_colors.dart';
import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgets/Custom_Button/custom_button_with_svg.dart';
import 'controller/signup_controller.dart';

class SiginUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SiginUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white100),
      backgroundColor: AppColors.white100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppString.createAnaccount,
                  color: AppColors.primary700,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.putInformationtoSignup,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black800,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 28.h),

                /// Name Input
                CustomTextField(
                  textEditingController: controller.nameController,
                  labelText: AppString.name,
                  keyboardType: TextInputType.text,
                  borderRadius: 4,
                  hintText: AppString.name,
                  fieldBorderColor: AppColors.black400,
                  validator: (value) =>
                      value!.isEmpty ? "Name cannot be empty" : null,
                ),
                SizedBox(height: 24.h),

                /// Email Input
                CustomTextField(
                  textEditingController: controller.emailController,
                  labelText: AppString.email,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 4,
                  hintText: AppString.email,
                  fieldBorderColor: AppColors.black400,
                  validator: (value) {
                    if (value!.isEmpty) return "Email cannot be empty";
                    if (!value.contains("@")) return "Enter a valid email";
                    return null;
                  },
                ),
                SizedBox(height: 24.h),

                /// Password Input
                CustomTextField(
                  textEditingController: controller.passwordController,
                  labelText: AppString.password,
                  keyboardType: TextInputType.visiblePassword,
                  borderRadius: 4,
                  hintText: AppString.password,
                  fieldBorderColor: AppColors.black400,
                  //obscureText = true,
                  validator: (value) {
                    if (value!.isEmpty) return "Password cannot be empty";
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.h),

                /// Confirm Password Input
                CustomTextField(
                  textEditingController: controller.confirmPasswordController,
                  labelText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                  borderRadius: 4,
                  hintText: "Confirm Password",
                  fieldBorderColor: AppColors.black400,
                  //obscureText = true,
                  validator: (value) {
                    if (value!.isEmpty) return "Password cannot be empty";
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    if (value != controller.passwordController.text) {
                      return "Paswword do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 28.h),

                /// Create Account Button
                Obx(() => CustomButton(
                      onTap: () {
                        Get.toNamed(AppRoute.bottomeNavBar);
                      },
                      title: controller.isLoading.value
                          ? "Signing Up..."
                          : AppString.createAccount,
                      fillColor: AppColors.primary700,
                      textColor: AppColors.white300,
                    )),

                /// Already have an account? Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppString.alreadyhaveaccount,
                      color: AppColors.black400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => LoginPage()),
                      child: CustomText(
                        text: AppString.signin,
                        color: AppColors.blue500,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),

                /// Social Sign-in Buttons
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.black400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomText(
                        text: AppString.orSignupwih,
                        color: AppColors.black400,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.black400)),
                  ],
                ),
                SizedBox(height: 21.h),
                CustomSvgButton(
                    svgPath: AppIcons.apple, height: 56, onPressed: () {}),
                SizedBox(height: 10.h),
                CustomSvgButton(
                    svgPath: AppIcons.google, height: 56, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
