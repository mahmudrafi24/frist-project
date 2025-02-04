import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgets/Custom_Expanded_Card/custom_expanded_card.dart';

class CourseOne extends StatefulWidget {
  const CourseOne({super.key});

  @override
  State<CourseOne> createState() => _CourseOneState();
}

class _CourseOneState extends State<CourseOne> {
  bool isExpanded = false;

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
        title: CustomText(
          text: AppString.studypageappbartitle,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              CustomText(
                text: AppString.courseOneHeading,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black500,
                maxLines: 3,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
              ExpandableCard(
                completedLesson: 2,
                totalLesson: 6,
                hours: 3,
                minutes: 28,
                progress: 50,
                title: AppString.studypageappbartitle,
                lessons: [
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                ],
              ),
              SizedBox(height: 10),
              ExpandableCard(
                completedLesson: 2,
                totalLesson: 6,
                hours: 3,
                minutes: 28,
                progress: 50,
                title: AppString.studypageappbartitle,
                lessons: [
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                ],
              ),
              SizedBox(height: 10),
              ExpandableCard(
                completedLesson: 2,
                totalLesson: 6,
                hours: 3,
                minutes: 28,
                progress: 50,
                title: AppString.studypageappbartitle,
                lessons: [
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                  'Brainstorming Basics',
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
