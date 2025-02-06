import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/CustomeCard/course_one_question_tile.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';

class QuestionAfterVideo extends StatefulWidget {
  const QuestionAfterVideo({super.key});

  @override
  State<QuestionAfterVideo> createState() => _QuestionAfterVideoState();
}

class _QuestionAfterVideoState extends State<QuestionAfterVideo> {
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
          "Back",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black700,
          ),
        ),
        titleSpacing: -7,
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
                    height: 16,
                    width: 16,
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
