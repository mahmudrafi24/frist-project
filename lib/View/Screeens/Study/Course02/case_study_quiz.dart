import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Expanded_Card/custom_expanded_container.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgets/CustomeCard/course_one_question_tile.dart';

class CaseStudyQuiz extends StatefulWidget {
  const CaseStudyQuiz({super.key});

  @override
  State<CaseStudyQuiz> createState() => _CaseStudyQuizState();
}

class _CaseStudyQuizState extends State<CaseStudyQuiz> {
  int? selectedAnswerIndex;
  int correctAnswerIndex = 2;
  bool isSubmitted = false;

  void handleAnswerSelection(String selectedOption, int index) {
    setState(() {
      selectedAnswerIndex = index;
      isSubmitted =
          false; // Reset submission state when a new answer is selected
    });
  }

  void handleSubmit() {
    setState(() {
      isSubmitted = true; // Mark the answer as submitted
    });
  }

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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.c02questin,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black600,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.h),

              // Expandable Containers
              ExpandableContainer(
                title: AppString.c02ddbar01,
                description: AppString.c02ddDescription,
                expandIcon: AppIcons.down,
                collapseIcon: AppIcons.up,
                expandedColor1: AppColors.primary700,
                expandedColor2: AppColors.primary50,
                collapsedColor: AppColors.blue50,
                textColor: AppColors.black500,
                expandedTextColor: AppColors.white100,
              ),
              SizedBox(height: 12.h),
              ExpandableContainer(
                title: AppString.c02ddbar02,
                description: AppString.c02ddDescription,
                expandIcon: AppIcons.down,
                collapseIcon: AppIcons.up,
                expandedColor1: AppColors.primary700,
                expandedColor2: AppColors.primary50,
                collapsedColor: AppColors.blue50,
                textColor: AppColors.black500,
                expandedTextColor: AppColors.white100,
              ),
              SizedBox(height: 12.h),
              ExpandableContainer(
                title: AppString.c02ddbar03,
                description: AppString.c02ddDescription,
                expandIcon: AppIcons.down,
                collapseIcon: AppIcons.up,
                expandedColor1: AppColors.primary700,
                expandedColor2: AppColors.primary50,
                collapsedColor: AppColors.blue50,
                textColor: AppColors.black500,
                expandedTextColor: AppColors.white100,
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: AppString.c02quiztitle,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black600,
              ),
              SizedBox(height: 12.h),

              /// **Question and Answers**
              QuestionTile(
                questionNumber: 01,
                questionText: AppString.c02qusTitle,
                options: [
                  AppString.c02ans01,
                  AppString.c02ans02,
                  AppString.c02ans03,
                  AppString.c02ans04,
                ],
                onSelected: (selectedAnswerIndex, index) {
                  handleAnswerSelection(selectedAnswerIndex, index);
                },
              ),
              SizedBox(height: 20.h),

              /// **Show Correct/Wrong Answer after submission**
              if (isSubmitted)
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        selectedAnswerIndex == correctAnswerIndex
                            ? AppIcons.correctanswer
                            : AppIcons.wronganswer,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: selectedAnswerIndex == correctAnswerIndex
                            ? "Correct Answer"
                            : "Wrong Answer",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedAnswerIndex == correctAnswerIndex
                            ? AppColors.green500
                            : AppColors.red500,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20.h),

              /// **Show "See Explanation" only if the answer is wrong**
              if (isSubmitted && selectedAnswerIndex != correctAnswerIndex)
                CustomButton(
                  onTap: () {
                    // Handle explanation logic here
                  },
                  fillColor: AppColors.white700,
                  textColor: AppColors.black500,
                  title: "See Explanation",
                ),
              SizedBox(height: 20.h),

              /// **Submit Button**
              CustomButton(
                onTap: handleSubmit,
                fillColor: AppColors.primary700,
                textColor: AppColors.white100,
                title: AppString.submit,
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
