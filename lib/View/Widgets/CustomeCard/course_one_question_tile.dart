import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import '../../../Utils/AppColors/app_colors.dart';

class QuestionTile extends StatefulWidget {
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
  State createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  int? selectedIndex; // Stores selected option index

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "${widget.questionNumber}. ${widget.questionText}",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black600,
          maxLines: 4,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.options.length, (index) {
            return RadioListTile<int>(
              title: CustomText(
                text: widget.options[index],
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black600,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              value: index,
              groupValue: selectedIndex,
              activeColor: AppColors.primary700,
              onChanged: (int? value) {
                setState(() {
                  selectedIndex = value;
                });
                if (widget.onSelected != null) {
                  widget.onSelected!(widget.options[index], index);
                }
              },
            );
          }),
        ),
      ],
    );
  }
}
