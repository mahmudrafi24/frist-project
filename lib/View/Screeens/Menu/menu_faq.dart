import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';
import '../../Widgets/Custom_Text/custom_text.dart';

class MenuFrequentlyAsked extends StatelessWidget {
  const MenuFrequentlyAsked({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> textList = [
      AppString.tnc01,
      AppString.tnc02,
      AppString.tnc03,
      AppString.tnc04,
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.studybackbutton),
        ),
        title: Text(
          AppString.faqdraw,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(textList.length, (index) {
              return Column(
                children: [
                  CustomText(
                    text: textList[index],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black300,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
