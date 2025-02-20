import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgets/Custom_Button/custom_button.dart';
import '../../Widgets/Custom_Text/custom_text.dart';
import '../../Widgets/CustomTextField/custome_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                text: AppString.resetPass,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primary700,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text: AppString.createnewPass,
                fontSize: 12,
                color: AppColors.black400,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              SizedBox(
                height: 28.h,
              ),

              /// Create Password input Text Field
              CustomTextField(
                labelText: AppString.createPass,
                keyboardType: TextInputType.visiblePassword,
                borderRadius: 4,
                hintText: AppString.createPass,
                fieldBorderColor: AppColors.black400,
              ),
              SizedBox(
                height: 17.h,
              ),

              /// Confirm Password input Text Field
              CustomTextField(
                labelText: AppString.confirmpass,
                keyboardType: TextInputType.visiblePassword,
                borderRadius: 4,
                hintText: AppString.confirmpass,
                fieldBorderColor: AppColors.black400,
              ),
              SizedBox(
                height: 05.h,
              ),
              CustomText(
                text: AppString.use8char,
                fontSize: 12,
                color: AppColors.black400,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 28.h,
              ),

              /// Change Password Button
              CustomButton(
                onTap: () {
                  Get.to(LoginPage());
                },
                title: AppString.changepass,
                fillColor: AppColors.primary700,
                textColor: AppColors.white300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
