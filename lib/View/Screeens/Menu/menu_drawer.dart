import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/View/Screeens/Menu/menu_community.dart';
import 'package:frist_project/View/Screeens/Menu/menu_saved.dart';
import 'package:frist_project/View/Screeens/Menu/menu_student_revirews.dart';
import 'package:frist_project/View/Screeens/Menu/menu_support.dart';
import 'package:frist_project/View/Screeens/Profile/profile_settings.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../../Utils/StaticString/static_string.dart';
import 'menu_faq.dart';
import 'menui_give_reviews.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  List<String> iconList = [
    AppIcons.faq,
    AppIcons.givereviews,
    AppIcons.streviews,
    AppIcons.support,
    AppIcons.community,
    AppIcons.saved,
    AppIcons.profileSettings,
  ];

  List<String> titleList = [
    AppString.faqdraw,
    AppString.giveReviews,
    AppString.studenReviews,
    AppString.support,
    AppString.community,
    AppString.saved,
    AppString.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // Corrected placement of Drawer
        child: Container(
          padding: EdgeInsets.only(left: 22, top: 48, right: 46),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  AppImages.drawerImage), //  Fixed `AssetImage` usage
              fit: BoxFit.cover, //  Moved `fit` outside of `AssetImage`
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.drawerProfile, //  Corrected `Image.asset`
                          height: 48, //  Proper placement of height
                          width: 48, //  Proper placement of width
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppString.welcomeback,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white100,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            CustomText(
                              text: AppString.namePlaceHolder,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white100,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ...List.generate(iconList.length, (index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Get.to(() => MenuFrequentlyAsked());
                                  break;
                                case 1:
                                  Get.to(() => MenuiGiveReviews());
                                  break;
                                case 2:
                                  Get.to(() => MenuStudentRevirews());
                                  break;
                                case 3:
                                  Get.to(() => MenuSupport());
                                  break;
                                case 4:
                                  Get.to(() => MenuCommunity());
                                  break;
                                case 5:
                                  Get.to(() => MenuSaved());
                                  break;
                                case 6:
                                  Get.to(() => ProfileSettings());
                                  break;
                              }
                            },
                            leading: SvgPicture.asset(iconList[index]),
                            title: CustomText(
                              text: titleList[index],
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white100,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: AppColors.white100,
                          )
                        ],
                      );
                    }),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary700,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            color: AppColors.white100,
                            borderRadius: BorderRadius.circular(16)),
                        child: Icon(Icons.arrow_upward_outlined),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomText(
                        text: AppString.upgradedes,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white100,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        onTap: () {},
                        fillColor: AppColors.white100,
                        textColor: AppColors.black500,
                        title: AppString.upgrade,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
