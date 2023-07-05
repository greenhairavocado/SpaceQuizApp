import 'dart:async';

import 'package:get/get.dart';

import '../screens/home_page.dart';
import '../screens/sign_in_screen.dart';
import '../user_local_services/user_local_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    checkStayLogin();
    super.onReady();
  }

  checkStayLogin() {
    if (UserLocalService.getUserId() != null) {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(const HomePage());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(const SignInScreen());
      });
    }
  }
}
