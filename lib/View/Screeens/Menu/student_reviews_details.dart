import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';

class StudentReviewsDetails extends StatelessWidget {
  const StudentReviewsDetails({super.key});

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
          AppString.studenReviews,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                AppImages.studentImage,
                height: 210,
                width: 210,
              ),
              const SizedBox(height: 40),
              CustomText(
                text: AppString.student,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: AppString.designation,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black400,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.0, // Set the size of the stars
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: AppColors.darkBlue500, // Default unselected color
                    ),
                    // Ensures unselected stars remain white
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: 08.w),
                  CustomText(
                    text: '5.0 Rating',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black500,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: AppString.reviewDetails01,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black500,
                textAlign: TextAlign.justify,
                maxLines: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
