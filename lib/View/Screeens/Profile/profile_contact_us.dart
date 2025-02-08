import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class ProfileContactUs extends StatefulWidget {
  const ProfileContactUs({super.key});

  @override
  State<ProfileContactUs> createState() => _ProfileContactUsState();
}

class _ProfileContactUsState extends State<ProfileContactUs> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.writeDownProblem,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black300,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black50,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: CustomTextField(
                  // height: 370.h,
                  hintText: "Dear Sir",
                  fillColor: AppColors.white200,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: 15,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.darkBlue500,
                textColor: AppColors.white100,
                title: AppString.sendReport,
              ),
            ],
          ),
        ));
  }
}
