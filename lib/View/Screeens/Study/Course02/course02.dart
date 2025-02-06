import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/View/Screeens/Study/Course02/case_study_two.dart';
import 'package:frist_project/View/Widgets/CustomeCard/custome_card_case_study.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';

class CourseTwo extends StatefulWidget {
  const CourseTwo({super.key});

  @override
  State<CourseTwo> createState() => _CourseTwoState();
}

class _CourseTwoState extends State<CourseTwo> {
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
          text: AppString.courseTwo,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.caseTwomsg,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black600,
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),
            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomStudyCard(
                  onTap: () {
                    Get.to(CaseStudyTwo());
                  },
                  title: "NGN Case 1: Adult Health",
                  progress: 35,
                  totalQus: 6,
                  completedQus: 2,
                ),
              );
            }),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
