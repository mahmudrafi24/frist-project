import 'dart:convert';

import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final _otpCode = ''.obs;
  final _email = ''.obs;
  final _isValid = false.obs;

  String get otpCode => _otpCode.value;
  String get email => _email.value;
  bool get isValid => _isValid.value;

  void updateOtpCode(String otpCode) {
    _otpCode.value = otpCode;
  }

  void updateEmail(String email) {
    _email.value = email;
  }

  // Create an instance of GetConnect
  final GetConnect _getConnect = GetConnect();

  Future<void> verifyOtpCode() async {
    // Assuming you have an API endpoint to verify the OTP code
    try {
      final response = await _getConnect.post(
        'http://10.0.80.49:6000/api/v1/auth/verify-email',
        // Headers and request body
        jsonEncode({
          'email': _email.value,
          'oneTimeCode': _otpCode.value,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle successful verification
        _isValid.value = true;
        print("OTP verified successfully!");
        //Get.to(() => LoginPage());
      } else {
        // Handle failure case
        _isValid.value = false;
        print("OTP verification failed. ${response.body}");
      }
    } catch (e) {
      // Catch any errors that might occur during the request
      _isValid.value = false;
      print("Error during OTP verification: $e");
    }
  }
}
