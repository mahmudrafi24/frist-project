import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import '../../../Home/home_screen.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  var isLoading = false.obs;
  var isCheckedBox = false.obs; // Checkbox state
  final GetConnect _getConnect = GetConnect();

  Future<void> login() async {
    if (!isCheckedBox.value) {
      Get.snackbar(
        "Error",
        "Please accept the terms and conditions",
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );
      return;
    }

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and Password are required",
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );
      return;
    }

    isLoading.value = true;

    try {
      final response = await _getConnect.post(
        "http://192.168.10.13:7000/api/v1/auth/login",
        {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Login successful!",
          backgroundColor: AppColors.green600,
          colorText: AppColors.white100,
        );

        // Navigate to the home page after login
        Get.offAll(() => HomeScreen());
      } else {
        print("Error: ${response.body}");
        Get.snackbar(
          "Error",
          response.body['message'] ?? "Invalid credentials",
          backgroundColor: AppColors.red600,
          colorText: AppColors.white100,
        );
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
