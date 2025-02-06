import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import '../../../Utils/AppColors/app_colors.dart';
class QuestionTile extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final List<String> options;
  final Function(String, int)? onSelected; // Accepts both answer text and index

  const QuestionTile({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.options,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "$questionNumber. $questionText",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black600,
        ),
        SizedBox(height: 8.h),
        Column(
          children: List.generate(options.length, (index) {
            return GestureDetector(
              onTap: () {
                onSelected!(options[index], index); // Pass both value & index
              },
              child: Container(
                padding: EdgeInsets.all(12.h),
                margin: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary700),
                ),
                child: CustomText(
                  text: options[index],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black600,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
