import 'package:astroquiz/common/common_toast.dart';
import 'package:astroquiz/config/colors.dart';
import 'package:astroquiz/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  ///Sign up
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSignUpEmail = TextEditingController();
  TextEditingController txtSignUpPassWord = TextEditingController();
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  signUpWithEmail() async {
    isLoading.value = true;
    Map<String, dynamic> response =
        await AuthRepository.signUpWithEmailAndPassword(
            txtSignUpEmail.text, txtSignUpPassWord.text);
    if (response["status"] == true) {
      if (response["user_id"] != "" && response["user_id"] != null) {
        String userId = response["user_id"];
        await AuthRepository.setUserLogInData({
          "email": txtSignUpEmail.text,
          "name": txtName.text,
          "userid": userId,
          "history": []
        }).then((value) {
          if (value) {
            commonToaster(
                message: response["message"],
                backgroundColor: AppColors.greenColor);
            Get.back();
          }
        });
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
