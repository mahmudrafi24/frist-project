import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/AppImg/app_images.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgets/Custom_Text/custom_text.dart';

class MenuCommunity extends StatefulWidget {
  const MenuCommunity({super.key});

  @override
  State<MenuCommunity> createState() => _MenuCommunityState();
}

class _MenuCommunityState extends State<MenuCommunity> {
  final List<String> options = ['Newest', 'Trending'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(AppIcons.studybackbutton),
        ),
        title: Text(
          AppString.community,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black700,
          ),
        ),
        backgroundColor: AppColors.white100,
      ),
      backgroundColor: AppColors.white100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.cummnitytitle,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              maxLines: 4,
              color: AppColors.black500,
            ),
            SizedBox(height: 10.h),
            _buildTabBar(),
            SizedBox(height: 20.h),
            CustomText(
              text: selectedIndex == 0 ? "Newest" : "Trending",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black500,
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                children: [
                  _buildLearningCard(
                    image: AppImages.profileImage,
                    studentName: "Alisha Humphrey",
                    designation: "Student",
                    reasoning: AppString.communityQues01,
                    onTap: () {},
                  ),
                  SizedBox(height: 15.h),
                  _buildLearningCard(
                    image: AppImages.profileImage,
                    studentName: "Marial Oppusa",
                    designation: "Mentor",
                    reasoning: AppString.communityQues01,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: List.generate(
        options.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selectedIndex == index
                        ? AppColors.darkBlue500
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
                        ? AppColors.darkBlue500
                        : AppColors.black200,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildLearningCard({
  required String image,
  required String studentName,
  required String designation,
  required String reasoning,
  required VoidCallback onTap,
}) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: AppColors.darkBlue50,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: AppColors.primary700),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 20.r,
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: studentName,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black500,
                ),
                SizedBox(height: 2.h),
                CustomText(
                  text: designation,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black300,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomText(
          text: reasoning,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black500,
          maxLines: 6,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          fieldBorderColor: AppColors.black200,
          fillColor: AppColors.white200,
          hintText: "Write your answer....",
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.grey500,
          ),
          suffixIcon: IconButton(
              onPressed: onTap, icon: SvgPicture.asset(AppIcons.send)),
        )
        // TextField(
        //   decoration: InputDecoration(
        //     hintText: "Write your answer...",
        //     fillColor: AppColors.white100,
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(8.r),
        //       borderSide: BorderSide(color: AppColors.grey500),
        //     ),
        //     suffixIcon: IconButton(
        //       onPressed: onTap,
        //       icon: SvgPicture.asset(AppIcons.send),
        //     ),
        //   ),
        // )
      ],
    ),
  );
}
