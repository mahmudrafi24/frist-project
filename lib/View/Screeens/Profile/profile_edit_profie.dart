import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppIcons/app_icons.dart';
import 'package:frist_project/Utils/AppImg/app_images.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/StaticString/static_string.dart';

class ProfileEditProfie extends StatefulWidget {
  const ProfileEditProfie({super.key});

  @override
  State<ProfileEditProfie> createState() => _ProfileEditProfieState();
}

class _ProfileEditProfieState extends State<ProfileEditProfie> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        // _checkForUpdates();
      });
    }
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
          AppString.editProfile,
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
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : const AssetImage(AppImages.profileImage)
                                as ImageProvider,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: InkWell(
                          onTap: _pickImage,
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.primary700,
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
                              color: AppColors.white100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: AppString.profileName,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black500,
                  )
                ],
              ),
            ),
            Column(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
