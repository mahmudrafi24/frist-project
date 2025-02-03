import 'package:frist_project/View/Screeens/Home/home_screen.dart';
import 'package:frist_project/View/Screeens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  ///==================== Initial Routes ====================
  static const String splashscreen = "/splash_screen";
  static const String homeScreen = "/homeScreen";

  ///==================== Routes with parameters ====================
  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => SplashScreen()),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
