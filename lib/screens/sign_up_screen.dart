import 'package:astroquiz/common/common_button.dart';
import 'package:astroquiz/common/common_textfield.dart';
import 'package:astroquiz/common/common_toast.dart';
import 'package:astroquiz/common/text.dart';
import 'package:astroquiz/config/colors.dart';
import 'package:astroquiz/config/common.dart';
import 'package:astroquiz/config/fonts.dart';
import 'package:astroquiz/config/images.dart';
import 'package:astroquiz/config/validator.dart';
import 'package:astroquiz/controller/signup_controller.dart';
import 'package:astroquiz/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/strings.dart';
import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        margin: EdgeInsets.only(top: MediaQuery
            .of(context)
            .padding
            .top),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages.commonBg), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// header
                spaceWidgetHeight(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1),
                text(
                  text: StringConst.appName,
                  style: const TextStyle(
                      fontSize: 36,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFonts.nunito,
                      shadows: [
                        Shadow(
                            color: AppColors.shadowColor,
                            offset: Offset(-1, 1),
                            blurRadius: 15)
                      ]),
                ),
                spaceWidgetHeight(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.04),
                Image.asset(MyImages.quizIcon, height: 100, width: 150),
                spaceWidgetHeight(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.1),

                /// name
                Form(
                  key: _signUpController.formKey,
                  child: Column(
                    children: [
                      CommonTextField(
                        controller: _signUpController.txtName,
                        contentPadding: const EdgeInsets.all(10),
                        hintText: StringConst.enterYourName,
                        keyboardType: TextInputType.emailAddress,
                        filled: true,
                        bgColor: AppColors.primaryColor,
                        validator: (value) {
                          return Validator.nameValidation(value ?? "");
                        },
                      ),
                      spaceWidgetHeight(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.035),

                      /// email
                      CommonTextField(
                        controller: _signUpController.txtSignUpEmail,
                        contentPadding: const EdgeInsets.all(10),
                        hintText: StringConst.enterYourEmail,
                        keyboardType: TextInputType.emailAddress,
                        filled: true,
                        bgColor: AppColors.primaryColor,
                        validator: (value) {
                          return Validator.emailValidation(value);
                        },
                      ),
                      spaceWidgetHeight(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.035),

                      /// password
                      CommonTextField(
                        controller: _signUpController.txtSignUpPassWord,
                        contentPadding: const EdgeInsets.all(10),
                        hintText: StringConst.enterYourPassword,
                        keyboardType: TextInputType.emailAddress,
                        filled: true,
                        bgColor: AppColors.primaryColor,
                        validator: (passCurrentValue) {
                          return Validator.passwordValidation(passCurrentValue);
                        },
                      ),
                      spaceWidgetHeight(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.01),
                    ],
                  ),
                ),

                /// text
                InkWell(
                  onTap: () {
                    Get.to(const SignInScreen());
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: StringConst.signUpWarning,
                        style: TextStyle(
                            color: AppColors.whiteTxtColor.withOpacity(0.4),
                            fontSize: 15,
                            fontFamily: MyFonts.nunito,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: StringConst.signIn,
                            style: TextStyle(
                                color: AppColors.whiteTxtColor.withOpacity(0.7),
                                fontSize: 17,
                                fontFamily: MyFonts.nunito,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                spaceWidgetHeight(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                ),

                /// signUp button

                Obx(
                      () =>
                  _signUpController.isLoading.value
                      ? const CircularProgressIndicator()
                      : CommonButton(
                    btnText: StringConst.signUp,
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.45,
                    onTap: () async {
                      if (_signUpController.formKey.currentState!
                          .validate()) {
                        _signUpController.signUpWithEmail();
                      } else {
                        commonToaster(
                            message: "Please fill all details",
                            backgroundColor: Colors.red);
                      }
                    },
                    fontSize: 18,
                    textColor: AppColors.whiteTxtColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
