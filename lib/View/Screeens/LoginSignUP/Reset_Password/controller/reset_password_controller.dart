import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';

import '../../Login/login_page.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var isLoading = false.obs;
  var passwordError = "".obs;
  var confirmPasswordError = "".obs;
  var token = ''.obs; // Store OTP token for validation

  final GetConnect _getConnect = GetConnect();

  /// **Set Token from OTP Verification**
  void setToken(String receivedToken) {
    token.value = receivedToken;
  }

  /// **Validate Password in Real-Time**
  void validatePassword() {
    if (newPasswordController.text.length < 8) {
      passwordError.value = "Password must be at least 8 characters long";
    } else {
      passwordError.value = "";
    }
  }

  /// **Validate Confirm Password**
  void validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError.value = "Please confirm your password";
    } else if (confirmPasswordController.text != newPasswordController.text) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = "";
    }
  }

  /// **Reset Password API Call**
  Future<bool> resetPassword() async {
    if (newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Both fields are required",
          backgroundColor: AppColors.red600, colorText: AppColors.white100);
      return false;
    }

    if (newPasswordController.text.length < 8) {
      Get.snackbar("Error", "Password must be at least 8 characters long",
          backgroundColor: AppColors.red600, colorText: AppColors.white100);
      return false;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          backgroundColor: AppColors.red600, colorText: AppColors.white100);
      return false;
    }

    isLoading.value = true;

    try {
      final response = await _getConnect.post(
        "http://10.0.80.49:6000/api/v1/auth/reset-password",
        {
          "newPassword": newPasswordController.text,
          "confirmPassword": confirmPasswordController.text,
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': '${token.value}', // Pass OTP verification token
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Password updated successfully!",
            backgroundColor: AppColors.green600, colorText: AppColors.white100);

        Get.offAll(() => LoginPage()); // Navigate to login after success
        return true;
      } else {
        Get.snackbar("Error", response.body['message'] ?? "Failed to reset password",
            backgroundColor: AppColors.red600, colorText: AppColors.white100);
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar("Error", "Something went wrong. Please try again later.",
          backgroundColor: AppColors.red600, colorText: AppColors.white100);
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
