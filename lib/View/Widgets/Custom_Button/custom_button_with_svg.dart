import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';

class CustomSvgButton extends StatelessWidget {
  final String svgPath;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  const CustomSvgButton({
    super.key,
    required this.svgPath,
    this.width,
    this.height,
    this.backgroundColor = AppColors.white100,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8), // Added padding for better visibility
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            svgPath, // Correct placement of the asset path
            width: 20, // Provide a default width
            height: 24, // Provide a default height
            fit: BoxFit.contain, // Ensure proper scaling
          ),
        ),
      ),
    );
  }
}
