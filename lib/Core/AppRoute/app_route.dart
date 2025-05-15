import 'package:frist_project/View/Screeens/BottomNav/bottom_nav.dart';
import 'package:frist_project/View/Screeens/Home/home_screen.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/Login/login_page.dart';
import 'package:frist_project/View/Screeens/LoginSignUP/OTP/otp_authentication.dart';
import 'package:frist_project/View/Screeens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

import '../../View/Screeens/LoginSignUP/Reset_Password/reset_password.dart';
import '../../View/Screeens/LoginSignUP/forgot_password/forgot_password_page.dart';
import '../../View/Screeens/LoginSignUP/sign_up/sigin_up_page.dart';

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashscreen = "/splash_screen";
  static const String homeScreen = "/homeScreen";
  static const String loginScreen = "/loginScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String otpScreen = "/otpScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";
  static const String bottomeNavBar = "/bottomeNavBar";

  ///==================== Routes with parameters ====================
  static List<GetPage> routes = [
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: bottomeNavBar,
      page: () => BottomNavScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUpScreen,
      page: () => SiginUpPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpAuthentication(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPassword(),
      transition: Transition.rightToLeft,
    ),
  ];
}
