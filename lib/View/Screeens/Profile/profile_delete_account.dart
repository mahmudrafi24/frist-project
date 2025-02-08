import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgets/CustomTextField/custome_text_field.dart';
import '../../Widgets/Custom_Button/custom_button.dart';
import '../../Widgets/Custom_Text/custom_text.dart';

class ProfileDeleteAccount extends StatefulWidget {
  const ProfileDeleteAccount({super.key});

  @override
  State<ProfileDeleteAccount> createState() => _ProfileDeleteAccountState();
}

class _ProfileDeleteAccountState extends State<ProfileDeleteAccount> {
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
              text: AppString.deleteaccDes,
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
              hintText: AppString.password,
              isPassword: true,
              fillColor: AppColors.white100,
              height: 56,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              onTap: () {},
              fillColor: AppColors.red500,
              textColor: AppColors.white100,
              title: AppString.deleteaccount,
            )
          ],
        ),
      ),
    );
  }
}
