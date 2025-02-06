import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

import '../../../Utils/AppColors/app_colors.dart';

class CustomCardCaseStudyTwo extends StatefulWidget {
  final String title;
  final String image01;
  final String image02;
  final String description;
  final VoidCallback onTap;
  const CustomCardCaseStudyTwo(
      {super.key,
      required this.title,
      required this.image01,
      required this.image02,
      required this.description,
      required this.onTap});

  @override
  State<CustomCardCaseStudyTwo> createState() => _CustomCardCaseStudyTwoState();
}

class _CustomCardCaseStudyTwoState extends State<CustomCardCaseStudyTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.studyCardColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.title,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.white100,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(widget.image01, fit: BoxFit.cover),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Divider(
            color: AppColors.white100,
            height: 1,
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: CustomText(
                  text: widget.description,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white100,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              IconButton(
                  onPressed: widget.onTap,
                  icon: SvgPicture.asset(widget.image02, fit: BoxFit.cover)),
            ],
          ),
        ],
      ),
    );
  }
}
