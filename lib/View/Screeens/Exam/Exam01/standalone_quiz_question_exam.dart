import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Button/custom_button.dart';
import '../../../Widgets/Custom_Expanded_Card/custom_expanded_container.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';
import '../../../Widgets/CustomeCard/course_one_question_tile.dart';
import '../../../Widgets/CustomeCard/custom_container_explanation.dart';

class StandaloneQuizQuestionExam extends StatefulWidget {
  const StandaloneQuizQuestionExam({super.key});

  @override
  State<StandaloneQuizQuestionExam> createState() =>
      _StandaloneQuizQuestionExamState();
}

class _StandaloneQuizQuestionExamState
    extends State<StandaloneQuizQuestionExam> {
  List<String> expandablelistTitle = [
    AppString.c02ddbar01,
    AppString.c02ddbar02,
    AppString.c02ddbar03,
  ];
  int? selectedAnswerIndex;
  int correctAnswerIndex = 2;
  bool isSubmitted = false;
  bool isExplained =
      false; // Controls whether the explanation is shown or hidden

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

  void toggleExplanation() {
    setState(() {
      isExplained = !isExplained; // Toggle the visibility of the explanation
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
          AppString.standalone,
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
              ...List.generate(expandablelistTitle.length, (index) {
                return Column(
                  children: [
                    ExpandableContainer(
                      title: expandablelistTitle[index],
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
                  ],
                );
              }),
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

              /// **Show Explanation Conditionally**
              if (isExplained)
                Column(
                  children: [
                    CustomContainerExplanation(
                      title: "Explanation",
                      paragraphs: [
                        AppString.courseoneNotePara01,
                        AppString.courseoneNotePara02,
                        AppString.courseoneNotePara03,
                        AppString.courseoneNotePara04,
                        AppString.courseoneNotePara05,
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),

              /// **Show "See/Hide Explanation" Button**
              if (isSubmitted &&
                  selectedAnswerIndex !=
                      correctAnswerIndex) // Show only for wrong answers
                CustomButton(
                  onTap: toggleExplanation, // Toggle explanation visibility
                  fillColor: AppColors.white100,
                  textColor: AppColors.black500,
                  borderSideColors: AppColors.black500,
                  title: isExplained
                      ? "Hide Explanation"
                      : "See Explanation", // Dynamic button text
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
