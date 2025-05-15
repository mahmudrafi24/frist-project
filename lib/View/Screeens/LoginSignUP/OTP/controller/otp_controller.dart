import 'dart:convert';
import 'package:get/get.dart';

import '../../Reset_Password/reset_password.dart';

class OtpController extends GetxController {
  final _otpCode = ''.obs;
  final _email = ''.obs;
  final _isValid = false.obs;
  final _token = ''.obs; // Store the verification token

  String get otpCode => _otpCode.value;
  String get email => _email.value;
  bool get isValid => _isValid.value;
  String get token => _token.value; // Get verification token

  void updateOtpCode(String otpCode) {
    _otpCode.value = otpCode;
  }

  void updateEmail(String email) {
    _email.value = email;
  }

  final GetConnect _getConnect = GetConnect();

  Future<void> verifyOtpCode() async {
    try {
      final response = await _getConnect.post(
        'http://10.0.80.49:6000/api/v1/auth/verify-email',
        jsonEncode({
          'email': _email.value,
          'oneTimeCode': _otpCode.value,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 && response.body['success'] == true) {
        _isValid.value = true;
        _token.value = response.body['data']; // Store the verification token
        print("OTP verified successfully!");

        // Navigate to Reset Password Page, passing the token
        Get.to(() => ResetPassword(token: _token.value));
      } else {
        _isValid.value = false;
        print("OTP verification failed. ${response.body}");
      }
    } catch (e) {
      _isValid.value = false;
      print("Error during OTP verification: $e");
    }
  }
}
