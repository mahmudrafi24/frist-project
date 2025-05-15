import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frist_project/Utils/AppColors/app_colors.dart';
import '../../OTP/otp_confirmation.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isLoading = false.obs;

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // Create an instance of GetConnect
  final GetConnect _getConnect = GetConnect();

  Future<Map<String, dynamic>> signUp() async {
    if (!_formKey.currentState!.validate()) {
      return {"error": "Invalid form data"};
    }

    isLoading.value = true;

    try {
      // Prepare the request body
      final requestBody = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirmPassword": passwordController.text,
        "role": "CREATOR"
      };

      // Add headers for JSON content
      final headers = {
        "Content-Type": "application/json",
      };

      // Make the POST request with JSON encoding and headers
      final response = await _getConnect.post(
        "http://10.0.80.49:6000/api/v1/users/",
        requestBody,
        headers: headers,
      );

      // Print the response status and body
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Check if the response body is null or empty
      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Account created successfully",
          backgroundColor: AppColors.green600,
          colorText: AppColors.white100,
        );
        Get.to(() => RegisterOtpConfirmScreen(email: emailController.text,));
        return response.body ?? {}; // Return an empty map if body is null
      } else {
        // If the response body is null or empty, avoid calling '[]' on it
        final errorMessage = response.body != null
            ? response.body['message']
            : 'Something went wrong';
        print("Error: $errorMessage");

        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: AppColors.red600,
          colorText: AppColors.white100,
        );

        return response.body ??
            {
              "error": "Unknown error"
            }; // Return a default error message if body is null
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: AppColors.red600,
        colorText: AppColors.white100,
      );

      return {"error": e.toString()}; // Return the exception as a response
    } finally {
      isLoading.value = false;
    }
  }
}
