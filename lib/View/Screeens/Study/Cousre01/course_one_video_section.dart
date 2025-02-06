import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frist_project/View/Screeens/Study/Cousre01/quiz_question.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/CustomeCard/custom_container_explanation.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../../Utils/AppIcons/app_icons.dart';
import '../../../../Utils/StaticString/static_string.dart';

class CourseOneVideoSection extends StatefulWidget {
  const CourseOneVideoSection({super.key});

  @override
  State<CourseOneVideoSection> createState() => _CourseOneVideoSectionState();
}

class _CourseOneVideoSectionState extends State<CourseOneVideoSection> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=f3POqcfPJZ8',
    )..initialize().then((_) {
        setState(() {}); // Update UI after initialization
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppIcons.studybackbutton),
        ),
        title: Text(
          "Back",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black700,
          ),
        ),
        titleSpacing: -7,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Course One Video",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Watch the video lesson below.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black600,
                ),
              ),
              SizedBox(height: 15),
              /*
              SizedBox(
                height: 225,
                width: double.infinity,
                child: _videoPlayerController.value.isInitialized
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          ),
                          IconButton(
                            icon: Icon(
                              _isPlaying ? Icons.pause_circle : Icons.play_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: _togglePlayPause,
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(Icons.fullscreen, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
              */
              Container(
                height: 225.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black300,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomContainerExplanation(
                title: "Notes",
                paragraphs: [
                  AppString.courseoneNotePara01,
                  AppString.courseoneNotePara02,
                  AppString.courseoneNotePara03,
                  AppString.courseoneNotePara04,
                  AppString.courseoneNotePara05,
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  Get.to(() => QuestionAfterVideo());
                },
                fillColor: AppColors.primary700,
                textColor: AppColors.white200,
                title: AppString.next,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
