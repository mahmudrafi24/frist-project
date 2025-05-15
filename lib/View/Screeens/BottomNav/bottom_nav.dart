import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/View/Screeens/Exam/exam.dart';
import 'package:frist_project/View/Screeens/Home/home_screen.dart';
import 'package:frist_project/View/Screeens/Material/material_screen.dart';
import 'package:frist_project/View/Screeens/Menu/menu_drawer.dart';
import 'package:frist_project/View/Screeens/Profile/profile_screen.dart';
import 'package:frist_project/View/Screeens/Study/study_screen.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    HomeScreen(),
    StudyScreen(),
    ExamScreen(),
    MaterialScreen(),
    ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),

      /// App Bar for all the pages
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: SvgPicture.asset(AppIcons.menu)),
        title: SvgPicture.asset(AppIcons.mainIcon),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.notification),
            onPressed: () {},
          )
        ],
        elevation: 1,
        backgroundColor: AppColors.white100,
      ),
      drawer: MenuDrawer(),

      /// Curved Bottom Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primary700,
        color: AppColors.white100,
        animationCurve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 500),
        height: 65,
        index: _currentIndex,
        items: List.generate(5, (index) {
          bool isActive = _currentIndex == index;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isActive
                  ? SvgPicture.asset(
                      [
                        AppIcons.homeWhite,
                        AppIcons.studyWhite,
                        AppIcons.examWhite,
                        AppIcons.materialWhite,
                        AppIcons.profileWhite
                      ][index],
                      height: 26,
                      width: 26,
                    )
                  : SvgPicture.asset(
                      [
                        AppIcons.home,
                        AppIcons.study,
                        AppIcons.exam,
                        AppIcons.material,
                        AppIcons.profile
                      ][index],
                      height: 26,
                      width: 26,
                    ),
              CustomText(
                text: ["Home", "Study", "Exam", "Material", "Profile"][index],
                fontSize: isActive ? 12 : 12,
                fontWeight: FontWeight.w400,
                color: isActive ? AppColors.white100 : AppColors.black800,
              ),
            ],
          );
        }),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
