import 'package:flutter/material.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:pp_progress_bar/pp_progress_bar.dart';

class CustomStudyCard extends StatefulWidget {
  final String title;
  final double progress;
  final double totalQus;
  final double completedQus;
  final VoidCallback onTap;
  const CustomStudyCard(
      {super.key,
      required this.title,
      required this.progress,
      required this.totalQus,
      required this.completedQus,
      required this.onTap});

  @override
  State<CustomStudyCard> createState() => _CustomStudyCardState();
}

class _CustomStudyCardState extends State<CustomStudyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.studyCardColor,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white300,
            ),
            SizedBox(height: 10),
            PPProgressBar(
              value: widget.progress / 100.0,
              height: 8,
              progressRadius: 1.0,
              progressColor: AppColors.studyCardProgressColor,
              trackColor: AppColors.contineuborderColor,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomText(
                text:
                    "${widget.completedQus.toInt()} out of ${widget.totalQus.toInt()} question tagged",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.white200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
