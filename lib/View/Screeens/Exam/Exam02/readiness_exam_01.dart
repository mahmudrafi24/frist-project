import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/Exam/Exam02/readiness_exam_02.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';

class ReadinessExamOne extends StatefulWidget {
  const ReadinessExamOne({super.key});

  @override
  State<ReadinessExamOne> createState() => _ReadinessExamOneState();
}

class _ReadinessExamOneState extends State<ReadinessExamOne> {
  List<String> readinees = [
    AppString.questions1,
    AppString.questions2,
    AppString.questions3
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar for all the pages
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.menu)),
        title: SvgPicture.asset(AppIcons.mainIcon),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.notification),
            onPressed: () {},
          )
        ],
        elevation: 1,
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.readinessExam,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
                maxLines: 2,
              ),
              SizedBox(height: 08.h),
              CustomText(
                text: AppString.pleaseRead,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black300,
              ),
              SizedBox(height: 08.h),
              ...List.generate(readinees.length, (index) {
                return CustomText(
                  text: readinees[index],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black500,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                );
              }),
              SizedBox(height: 15.h),
              CustomButton(
                onTap: () {
                  Get.to(() => ReadinessExamTwo());
                },
                fillColor: AppColors.primary700,
                textColor: AppColors.white100,
                title: AppString.startExam,
              ),
              SizedBox(height: 10.h),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.white100,
                textColor: AppColors.black500,
                title: AppString.goBack,
                borderSideColors: AppColors.black500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
