import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;
  final GetConnect _getConnect = GetConnect();

  Future<bool> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Email is required",
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );
      return false;
    }

    isLoading.value = true;

    try {
      final response = await _getConnect.post(
        "http://10.0.80.49:6000/api/v1/auth/forget-password",
        {"email": emailController.text},
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Password reset link sent to your email",
          backgroundColor: AppColors.green600,
          colorText: AppColors.white100,
        );
        return true;
      } else {
        Get.snackbar(
          "Error",
          response.body['message'] ?? "Failed to send reset link",
          backgroundColor: AppColors.red600,
          colorText: AppColors.white100,
        );
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
