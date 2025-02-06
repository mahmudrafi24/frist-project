import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/View/Screeens/Exam/Exam01/standalone_quiz_question_exam.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Expanded_Card/custom_expanded_container.dart';

class ExamStandaloneQuizPage extends StatefulWidget {
  const ExamStandaloneQuizPage({super.key});

  @override
  State<ExamStandaloneQuizPage> createState() => _ExamStandaloneQuizPageState();
}

class _ExamStandaloneQuizPageState extends State<ExamStandaloneQuizPage> {
  bool isChecked = false;
  List<String> standaloneQuestion = [
    "Health History",
    "Assessment",
    "Vitals Signs",
  ];
  List<String> topFiveSelect = [
    AppString.top01topic,
    AppString.top02topic,
    AppString.top03topic,
    AppString.top04topic,
    AppString.top05topic,
    AppString.top06topic,
    AppString.top07topic,
  ];
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
            children: [
              CustomText(
                text: AppString.c02questin,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black500,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.h),
              // Expandable Containers
              ...List.generate(standaloneQuestion.length, (index) {
                return Column(
                  children: [
                    ExpandableContainer(
                      title: standaloneQuestion[index],
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
              CustomText(
                text: AppString.top5Finding,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black500,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              Column(
                children: List.generate(topFiveSelect.length, (index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.blue900; // Color when checked
                            }
                            return AppColors.white100; // Color when unchecked
                          },
                        ),
                        checkColor: Colors.white,
                      ),
                      CustomText(
                        text: topFiveSelect[index],
                        color: AppColors.black400,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomButton(
                onTap: () {
                  Get.to(() => StandaloneQuizQuestionExam());
                },
                fillColor: AppColors.primary700,
                textColor: AppColors.white100,
                title: AppString.next,
              ),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
