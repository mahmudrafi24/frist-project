import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/View/Widgets/CustomTextField/custome_text_field.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

import '../../../Utils/AppIcons/app_icons.dart';

class CustomShowDialogBox extends StatefulWidget {
  const CustomShowDialogBox({super.key});

  @override
  State<CustomShowDialogBox> createState() => _CustomShowDialogBoxState();
}

class _CustomShowDialogBoxState extends State<CustomShowDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.white100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              CustomText(
                text: "Apply Study Schedule",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black500,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                borderRadius: 8,
                hintText: "Calendar",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey600,
                ),
                fillColor: AppColors.grey300,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppIcons.calendar),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextField(
                borderRadius: 8,
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey600,
                ),
                fillColor: AppColors.grey300,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextField(
                borderRadius: 8,
                hintText: "Description",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey600,
                ),
                fillColor: AppColors.grey300,
                height: 300.h,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomButton(
                onTap: () {},
                fillColor: AppColors.primary500,
                textColor: AppColors.white100,
                title: "Create",
              )
            ],
          ),
        ),
      ),
    );
  }
}
