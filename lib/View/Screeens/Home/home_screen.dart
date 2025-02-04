import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/AppIcons/app_icons.dart';
import 'package:frist_project/View/Screeens/Home/search_screen.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:frist_project/View/Widgets/Custom_Text_field/custome_text_field.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';

class HomeScreen extends StatefulWidget {
  final NotchBottomBarController? controller;
  const HomeScreen({super.key, this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                labelText: AppString.searcHere,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    AppIcons.search,
                  ),
                ),
                borderRadius: 8,
                height: 40,
                onTapClick: () {
                  SearchScreen();
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text: AppString.qoftheday,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black400,
              ),
              SizedBox(
                height: 15.h,
              ), // Declare outside StatefulBuilder to maintain state

              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.primary700, // Background color
                  borderRadius: BorderRadius.circular(8), // 8 Border Radius
                ),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppString.question,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white300,
                          maxLines: 5,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 12.h),

                        // List of answers
                        ...[
                          AppString.ans1,
                          AppString.ans2,
                          AppString.ans3,
                          AppString.ans4
                        ].map(
                          (text) => RadioListTile<String>(
                            title: CustomText(
                              text: text, // Use the text directly
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white300,
                            ),
                            value: text,
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                        ),
                        CustomButton(
                          fillColor: AppColors.white400,
                          onTap: () {},
                          title: AppString.submit,
                          textColor: AppColors.black500,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: AppString.category,
                color: AppColors.black600,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.circleBackgroundColor),
                        child: SvgPicture.asset(
                          AppIcons.men,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      CustomText(
                        text: AppString.mhealth,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.circleBackgroundColor),
                        child: SvgPicture.asset(
                          AppIcons.women,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      CustomText(
                        text: AppString.whealth,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.circleBackgroundColor),
                        child: SvgPicture.asset(
                          AppIcons.mental_health,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      CustomText(
                        text: AppString.mentalhealth,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.circleBackgroundColor),
                        child: SvgPicture.asset(
                          AppIcons.pregnancy,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(
                        text: AppString.pregnancy,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black500,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
