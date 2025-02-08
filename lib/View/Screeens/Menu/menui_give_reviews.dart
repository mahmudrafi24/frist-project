import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgets/Custom_Text/custom_text.dart';

class MenuiGiveReviews extends StatefulWidget {
  const MenuiGiveReviews({super.key});

  @override
  State<MenuiGiveReviews> createState() => _MenuiGiveReviewsState();
}

class _MenuiGiveReviewsState extends State<MenuiGiveReviews> {
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
          AppString.giveReviews,
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
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.darkBlue50,
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        text: AppString.giveReviews,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black700,
                      ),
                      SizedBox(height: 16.h),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.primary700,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: AppString.feelfreetogive,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black300,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                fieldBorderColor: AppColors.grey500,
                maxLines: 10,
                hintText: "Dear Sir",
              ),
              SizedBox(
                height: 35.h,
              ),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.primary700,
                textColor: AppColors.white100,
                title: AppString.submitReviews,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
