import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/View/Screeens/Profile/profile_settings.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 300.h,
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppIcons.profileImageElipe),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => ProfileSettings());
                      },
                      icon: SvgPicture.asset(
                        AppIcons.profileSettings,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                      AppImages.profileImage,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: AppString.profileName,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(08),
                    color: AppColors.primary500),
                child: Column(
                  children: [
                    CustomText(
                      text: AppString.accountDetails,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.userName,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.uname,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 05.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.useremail,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.uemail,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 05.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.contactnumber,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: AppString.contactnum,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
