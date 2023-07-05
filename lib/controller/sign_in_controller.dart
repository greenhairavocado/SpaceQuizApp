import 'package:astroquiz/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_toast.dart';
import '../config/colors.dart';
import '../data/repository/auth_repository.dart';
import '../user_local_services/user_local_service.dart';

class SignInController extends GetxController {
  /// SIgn in
  TextEditingController txtSignInEmail = TextEditingController();
  TextEditingController txtSignInPassWord = TextEditingController();
  RxBool isLoading = false.obs;

  signInWithEmail() async {
    isLoading.value = true;
    Map<String, dynamic> response =
        await AuthRepository.logInWithEmailAndPassword(
            txtSignInEmail.text, txtSignInPassWord.text);
    if (response["status"] == true) {
      if (response["user_id"] != "" && response["user_id"] != null) {
        String userId = response["user_id"];
        if (userId != "") {
          await AuthRepository.getUserData(userId).then((value) {
            if (value != null) {
              String userId = value["userid"];
              commonToaster(
                  message: response["message"],
                  backgroundColor: AppColors.greenColor);
              UserLocalService.setUserId(userId);
              Get.offAll(const HomePage());
            }
          });
        }
      } else {
        commonToaster(
            message: response["message"], backgroundColor: AppColors.red);
      }
    } else {
      commonToaster(
          message: response["message"], backgroundColor: AppColors.red);
    }
    isLoading.value = false;
  }
}
