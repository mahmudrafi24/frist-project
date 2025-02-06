import 'package:flutter/material.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

class CustomContainerExplanation extends StatelessWidget {
  final String title;
  final List<String> paragraphs;

  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  const CustomContainerExplanation({
    super.key,
    required this.title,
    required this.paragraphs,
    this.backgroundColor = AppColors.darkBlue50, // Default light blue color
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 15),
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black500,
          ),

          SizedBox(height: 10),

          // Paragraphs
          ...paragraphs.map((paragraph) => Column(
                children: [
                  CustomText(
                    text: paragraph,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black400,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }
}
