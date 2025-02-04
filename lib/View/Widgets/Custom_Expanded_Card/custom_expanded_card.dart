import 'package:flutter/material.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import 'package:pp_progress_bar/pp_progress_bar.dart';

import '../Custom_Text/custom_text.dart';

class ExpandableCard extends StatefulWidget {
  final double? totalLesson;
  final double? completedLesson;
  final double? hours;
  final double? minutes;
  final double progress;
  final String title;
  final List<String> lessons;

  const ExpandableCard({
    Key? key,
    required this.title,
    required this.lessons,
    required this.progress,
    this.totalLesson,
    this.completedLesson,
    this.hours,
    this.minutes,
  }) : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary700,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white500,
                ),
                SizedBox(height: 12),
                PPProgressBar(
                  value: widget.progress / 100.0,
                  height: 8,
                  progressRadius: 1.0,
                  progressColor: AppColors.blue500,
                  trackColor: AppColors.contineuborderColor,
                ),
                SizedBox(height: 10),
                CustomText(
                  text:
                      " - ${widget.completedLesson?.toInt() ?? 0} out of ${widget.totalLesson?.toInt() ?? 0} lessons completed",
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white200,
                ),
                SizedBox(height: 3),
                CustomText(
                  text:
                      " - Duration: ${widget.hours?.toInt() ?? 0}h ${widget.minutes?.toInt() ?? 0}min",
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white200,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary700,
              borderRadius: _isExpanded
                  ? BorderRadius.vertical(bottom: Radius.circular(8))
                  : BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: _isExpanded
                              ? "Hide all lessons"
                              : "Show all lessons",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white500,
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.white500,
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isExpanded)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: widget.lessons.map((lesson) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: AppColors.white500),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: lesson,
                                    fontSize: 12,
                                    color: AppColors.white500,
                                  ),
                                  Spacer(),
                                  CustomText(
                                    text: '9:12',
                                    fontSize: 12,
                                    color: AppColors.white500,
                                  ),
                                ],
                              ),
                              Divider(
                                  color: AppColors.white500.withOpacity(0.5)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
