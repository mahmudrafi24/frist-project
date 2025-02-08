import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppIcons/app_icons.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/BottomNav/bottom_nav.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/forgot_password_page.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/sigin_up_page.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button_with_svg.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.white100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.welcomeback,
                color: AppColors.primary700,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 12,
              ),
              CustomText(
                text: AppString.putInformationtoSignin,
                color: AppColors.black800,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                labelText: AppString.email,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 4,
                hintText: AppString.email,
                fieldBorderColor: AppColors.black400,
                height: 56,
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                labelText: AppString.password,
                keyboardType: TextInputType.visiblePassword,
                borderRadius: 4,
                hintText: AppString.password,
                fieldBorderColor: AppColors.black400,
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.blue700; // Color when checked
                            }
                            return AppColors.white100; // Color when unchecked
                          },
                        ),
                        checkColor: Colors.white,
                      ),
                      CustomText(
                        text: AppString.rememberme,
                        color: AppColors.black400,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(ForgotPasswordPage());
                    },
                    child: CustomText(
                      text: AppString.forghotpass,
                      color: AppColors.black400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                textColor: AppColors.white300,
                onTap: () {
                  Get.to(BottomNavScreen());
                },
                title: AppString.login,
                fillColor: AppColors.primary700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppString.donthaveAccount,
                    color: AppColors.black400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(SiginUpPage());
                    },
                    child: CustomText(
                      text: AppString.createAccount,
                      color: AppColors.blue500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.black400,
                      thickness: 1.0,
                    ),
                  ),
                  CustomText(
                    text: AppString.orsignwith,
                    color: AppColors.black400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.black400,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomSvgButton(
                svgPath: AppIcons.google,
                height: 56,
                onPressed: () {},
                // backgroundColor: AppColors.white100,
                // height: 56.h,
                // width: double.infinity,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomSvgButton(
                svgPath: AppIcons.apple,
                height: 56,
                onPressed: () {},
                //backgroundColor: AppColors.white50,
                // height: 56,
                // width: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
