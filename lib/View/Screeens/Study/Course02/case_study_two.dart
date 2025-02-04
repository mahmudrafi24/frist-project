import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/CustomeCard/custom_card_case_study_02.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../Widgets/Custom_Text/custom_text.dart';

class CaseStudyTwo extends StatelessWidget {
  const CaseStudyTwo({super.key});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomCardCaseStudyTwo(
              onTap: () {},
              title: "Item - 01",
              image01: AppIcons.casestudybookmark,
              image02: AppIcons.caseStudyforward,
              description: AppString.caseStudytwoDes,
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardCaseStudyTwo(
              onTap: () {},
              title: "Item - 01",
              image01: AppIcons.casestudybookmark,
              image02: AppIcons.caseStudyforward,
              description: AppString.caseStudytwoDes,
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardCaseStudyTwo(
              onTap: () {},
              title: "Item - 01",
              image01: AppIcons.casestudybookmark,
              image02: AppIcons.caseStudyforward,
              description: AppString.caseStudytwoDes,
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardCaseStudyTwo(
              onTap: () {},
              title: "Item - 01",
              image01: AppIcons.casestudybookmark,
              image02: AppIcons.caseStudyforward,
              description: AppString.caseStudytwoDes,
            ),
          ],
        ),
      ),
    );
  }
}
