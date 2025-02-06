import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/Core/AppRoute/app_route.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/Exam/Exam01/standalone_ques_screen.dart';
import 'package:frist_project/View/Screeens/Exam/Exam02/readiness_exam_01.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Utils/AppColors/app_colors.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white200,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210.h,
              decoration: BoxDecoration(
                  color: AppColors.white600,
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
              text: AppString.practiceTest,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: AppColors.blue900,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppString.standalone,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white100,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        text: AppString.standaloneDes,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white100,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.h),
                      CustomButton(
                        height: 32.h,
                        onTap: () {
                          Get.to(() => ExamStandaloneScreen());
                        },
                        fillColor: AppColors.white100,
                        textColor: AppColors.black500,
                        title: "Start",
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: AppColors.blue900,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppString.readiness,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white100,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.h),
                      CustomText(
                        text: AppString.readinessDes,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white100,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.h),
                      CustomButton(
                        height: 32.h,
                        onTap: () {
                          Get.to(() => ReadinessExamOne());
                        },
                        fillColor: AppColors.white100,
                        textColor: AppColors.black500,
                        title: "Start",
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
