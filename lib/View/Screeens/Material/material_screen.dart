import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/Material/create_study_schedule.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColors.white100,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff091ec2),
                      Color(0xff4d61ff),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppString.joinstudygroup,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white100,
                    ),
                    SizedBox(
                      height: 05.h,
                    ),
                    CustomText(
                      text: AppString.joinstudygropDes,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white100,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 07.h,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.to(()=>CreateStudySchedule());
                      },
                      fillColor: AppColors.white100,
                      textColor: AppColors.black500,
                      title: AppString.joinnow,
                      height: 36.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: AppString.studySchedule,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(
                height: 08.h,
              ),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.primary700,
                textColor: AppColors.white100,
                title: AppString.seeStudySchedule,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text: AppString.studyGuide,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(
                height: 08.h,
              ),
              Container(
                width: double.infinity,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffE8F3FF),
                ),
              ),
              SizedBox(
                height: 08.h,
              ),
              Container(
                width: double.infinity,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffE8F3FF),
                ),
              ),
              SizedBox(
                height: 08.h,
              ),
              Container(
                width: double.infinity,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffE8F3FF),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
