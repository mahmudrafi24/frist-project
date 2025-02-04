import 'package:flutter/material.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Screeens/Study/Course02/course02.dart';
import 'package:frist_project/View/Screeens/Study/cousre01/course01.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import 'package:pp_progress_bar/pp_progress_bar.dart';

import '../../../Utils/AppColors/app_colors.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  double progress = 80;
  double completeLesson = 23;
  int selectedIndex = 0; // 0 for PN, 1 for RN

  final List<String> options = ['PN', 'RN'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefffe),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.contineuLearn,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(height: 10),

              // Continue Learning Section
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white100,
                  border: Border.all(color: AppColors.contineuborderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "NGN - Case Study 101",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black500,
                    ),
                    SizedBox(height: 12),
                    PPProgressBar(
                      value: progress / 100.0,
                      height: 8,
                      progressRadius: 1.0,
                      progressColor: Color(0xff4f60f6),
                      trackColor: AppColors.contineuborderColor,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              "${completeLesson.toInt()} of ${progress.toInt()} lesson",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black200,
                        ),
                        CustomText(
                          text: "${progress.toInt()}% Completed",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // PN/RN Selection
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primary700,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    for (int index = 0; index < options.length; index++)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: selectedIndex == index
                                      ? AppColors.primary700
                                      : Colors.transparent,
                                  width: 4.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[index],
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? AppColors.primary700
                                      : AppColors.black200,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomText(
                text: selectedIndex == 0 ? "PN Learning" : "RN Learning",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(height: 20),
              // Learning Cards based on selection
              if (selectedIndex == 0) ...[
                _buildLearningCard(
                  onTap: () => Get.to(CourseOne()),
                  title: "PN Next Gen Course",
                  description:
                      "Learn everything about the PN Next Gen NCLEX. Walk through a full PN Next Gen case together.",
                ),
                SizedBox(height: 15),
                _buildLearningCard(
                  onTap: () => Get.to(CourseTwo()),
                  title: "PN Case Studies",
                  description:
                      "These PN case studies are based on the real Next Gen NCLEX. Practice to be ready for the exam.",
                ),
              ] else ...[
                _buildLearningCard(
                  onTap: () => Get.to(CourseOne()),
                  title: "RN Next Gen Course",
                  description:
                      "Learn everything about the RN Next Gen NCLEX. Walk through a full RN Next Gen case together.",
                ),
                SizedBox(height: 15),
                _buildLearningCard(
                  onTap: () => Get.to(CourseTwo()),
                  title: "RN Case Studies",
                  description:
                      "These RN case studies are based on the real Next Gen NCLEX. Practice to be ready for the exam.",
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLearningCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.darkBlue50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary700,
          ),
          SizedBox(height: 5),
          CustomText(
            text: description,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.black500,
            maxLines: 3,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Start now →",
                style: TextStyle(
                    color: Color(0xff3745AF), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
