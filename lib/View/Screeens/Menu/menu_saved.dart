import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class MenuSaved extends StatefulWidget {
  const MenuSaved({super.key});

  @override
  State<MenuSaved> createState() => _MenuSavedState();
}

class _MenuSavedState extends State<MenuSaved> {
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
          AppString.saved,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black700,
          ),
        ),
        titleSpacing: -7,
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: List.generate(5, (index) {
            return Card(
              color: AppColors.white100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: AppString.studypageappbartitle,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black500,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: AppString.caseTwomsg,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black500,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.savedpage),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.w),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
