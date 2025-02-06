import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';
import '../../../Widgets/CustomeCard/course_one_question_tile.dart';

class ReadinessExamTwo extends StatefulWidget {
  const ReadinessExamTwo({super.key});

  @override
  State<ReadinessExamTwo> createState() => _ReadinessExamTwoState();
}

class _ReadinessExamTwoState extends State<ReadinessExamTwo> {
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
          AppString.goBack,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomText(
                    text: AppString.courseOnequestionTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black600,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AppIcons.courseOneClock,
                    height: 16.h,
                    width: 16.w,
                  ),
                  CustomText(
                    text: "10:23",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black200,
                  ),
                ],
              ),
              ...List.generate(3, (index) {
                return QuestionTile(
                  questionNumber: 01,
                  questionText: AppString.courseOnequestion,
                  options: [
                    AppString.courseOneanser01,
                    AppString.courseOneanser02,
                    AppString.courseOneanser03,
                    AppString.courseOneanser04
                  ],
                );
              }),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.primary700,
                textColor: AppColors.white200,
                title: AppString.submit,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
