import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';
import 'profile_edit_profie.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
          AppString.settings,
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
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.profile),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.editProfile,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.to(() => ProfileEditProfie());
                      },
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 08.h),
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.termandcondition),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.termsnCondtion,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 08.h),
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.privacy),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.privacypolicy,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 08.h),
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.profile),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.contactUs,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 08.h),
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.changePassword),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.changepass,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 08.h),
            Card(
              color: AppColors.white100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.deleteaccount),
                    SizedBox(width: 08.w),
                    CustomText(
                      text: AppString.deleteaccount,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black500,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.forwarpage),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
