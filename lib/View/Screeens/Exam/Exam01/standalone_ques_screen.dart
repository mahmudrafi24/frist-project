import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/Exam/Exam01/standalone_quiz_exam_screen.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgets/CustomeCard/custome_card_case_study.dart';

class ExamStandaloneScreen extends StatefulWidget {
  const ExamStandaloneScreen({super.key});

  @override
  State<ExamStandaloneScreen> createState() => _ExamStandaloneScreenState();
}

class _ExamStandaloneScreenState extends State<ExamStandaloneScreen> {
  // List of card titles
  List<String> cardTitle = [
    "Free Question",
    "Adult Health",
    "Child Health",
    "Pregnancy",
    "Nutrition",
    "Mental Health"
  ];

  // Progress values for each card
  List<double> progressBar = [32, 27, 58, 14, 45, 79];

  // Completed questions for each card
  List<double> completedQuestion = [2, 4, 1, 4, 5, 3];

  // Total questions for each card (can be dynamic if needed)
  List<double> totalQuestions = [6, 6, 6, 6, 6, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.standalone,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: AppString.standoloneDescription,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black500,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
              SizedBox(
                height: 20.h,
              ),
              ...List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomStudyCard(
                    onTap: () {
                      Get.to(() => ExamStandaloneQuizPage());
                    },
                    title: cardTitle[index],
                    progress: progressBar[index],
                    totalQus: totalQuestions[index], // Dynamic total questions
                    completedQus: completedQuestion[index],
                    alignment: Alignment.bottomLeft,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
