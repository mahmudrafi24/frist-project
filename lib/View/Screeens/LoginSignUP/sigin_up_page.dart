import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/login_page.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/Custom_Text_field/custome_text_field.dart';
import 'package:frist_project/utils/AppColors/app_colors.dart';
import 'package:get/get.dart';

import '../../../Utils/AppIcons/app_icons.dart';
import '../../Widgets/Custom_Button/custom_button_with_svg.dart';

class SiginUpPage extends StatefulWidget {
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.createAnaccount,
              color: AppColors.primary700,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: AppString.putInformationtoSignup,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.black800,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
            SizedBox(
              height: 28.h,
            ),

            /// Name Input Text Field
            CustomTextField(
              labelText: AppString.name,
              keyboardType: TextInputType.emailAddress,
              borderRadius: 4,
              hintText: AppString.name,
              fieldBorderColor: AppColors.black400,
              height: 56,
            ),
            SizedBox(
              height: 24.h,
            ),

            /// Email input Text Field
            CustomTextField(
              labelText: AppString.email,
              keyboardType: TextInputType.emailAddress,
              borderRadius: 4,
              hintText: AppString.email,
              fieldBorderColor: AppColors.black400,
              height: 56,
            ),
            SizedBox(
              height: 24.h,
            ),

            /// Password input Text Field
            CustomTextField(
              labelText: AppString.password,
              keyboardType: TextInputType.visiblePassword,
              borderRadius: 4,
              hintText: AppString.password,
              fieldBorderColor: AppColors.black400,
            ),
            SizedBox(
              height: 28.h,
            ),

            /// Create Account Button
            CustomButton(
                onTap: () {},
                title: AppString.createAccount,
                fillColor: AppColors.primary700,
                textColor: AppColors.white300),
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
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: CustomText(
                    text: AppString.signin,
                    color: AppColors.blue500,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 26.h,
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
                  text: AppString.orSignupwih,
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
              height: 21.h,
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
      )),
    );
  }
}
