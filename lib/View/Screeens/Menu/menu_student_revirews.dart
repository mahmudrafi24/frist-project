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
import 'student_reviews_details.dart';

class MenuStudentRevirews extends StatefulWidget {
  const MenuStudentRevirews({super.key});

  @override
  State<MenuStudentRevirews> createState() => _MenuStudentRevirewsState();
}

class _MenuStudentRevirewsState extends State<MenuStudentRevirews> {
  double _rating = 0;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: List.generate(
              5,
              (index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => StudentReviewsDetails());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.black500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.studentImage,
                              height: 90.h,
                              width: 90.w,
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: _rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize:
                                          15.0, // Set the size of the stars
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: AppColors
                                            .primary700, // Default unselected color
                                      ),
                                      unratedColor: Colors
                                          .white, // Ensures unselected stars remain white
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(width: 08.w),
                                    Text(
                                        _rating > 0
                                            ? '$_rating Stars'
                                            : 'Review Title',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white100,
                                        ),)
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 180.w,
                                  child: CustomText(
                                    text: AppString.reviewDetails,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white100,
                                    maxLines: 10,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 08.h,
                                ),
                                CustomText(
                                  text: AppString.student,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white300,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
