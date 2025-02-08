import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppIcons/app_icons.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';

class ProfileChangePassoword extends StatefulWidget {
  const ProfileChangePassoword({super.key});

  @override
  State<ProfileChangePassoword> createState() => _ProfileChangePassowordState();
}

class _ProfileChangePassowordState extends State<ProfileChangePassoword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.studybackbutton),
        ),
        title: Text(
          AppString.changePassword,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black700,
          ),
        ),
        titleSpacing: -7,
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomText(
              text: AppString.changepasswordS,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black400,
              maxLines: 5,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextField(
              hintText: AppString.cpass,
              isPassword: true,
              fillColor: AppColors.white100,
              height: 56,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTextField(
              hintText: AppString.npass,
              isPassword: true,
              fillColor: AppColors.white100,
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTextField(
              hintText: AppString.npass,
              isPassword: true,
              fillColor: AppColors.white100,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              onTap: () {},
              fillColor: AppColors.darkBlue500,
              textColor: AppColors.white100,
              title: AppString.changePassword,
            )
          ],
        ),
      ),
    );
  }
}
