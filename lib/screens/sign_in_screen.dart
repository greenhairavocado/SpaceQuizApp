import 'package:astroquiz/common/common_button.dart';
import 'package:astroquiz/common/common_textfield.dart';
import 'package:astroquiz/common/text.dart';
import 'package:astroquiz/config/colors.dart';
import 'package:astroquiz/config/common.dart';
import 'package:astroquiz/config/fonts.dart';
import 'package:astroquiz/config/images.dart';
import 'package:astroquiz/config/validator.dart';
import 'package:astroquiz/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/strings.dart';
import '../controller/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = Get.put(SignInController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImages.commonBg), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                spaceWidgetHeight(
                    height: MediaQuery.of(context).size.height * 0.1),
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

                ///header
                spaceWidgetHeight(
                    height: MediaQuery.of(context).size.height * 0.04),
                Image.asset(MyImages.quizIcon, height: 100, width: 150),
                spaceWidgetHeight(
                    height: MediaQuery.of(context).size.height * 0.1),

                /// email
                CommonTextField(
                  controller: _signInController.txtSignInEmail,
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
                    height: MediaQuery.of(context).size.height * 0.035),

                /// password
                CommonTextField(
                  controller: _signInController.txtSignInPassWord,
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
                    height: MediaQuery.of(context).size.height * 0.01),

                /// signup string
                InkWell(
                  onTap: () {
                    Get.to(const SignUpScreen());
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: StringConst.signInWarning,
                        style: TextStyle(
                            color: AppColors.whiteTxtColor.withOpacity(0.4),
                            fontSize: 15,
                            fontFamily: MyFonts.nunito,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: StringConst.signUp,
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
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                /// sign in button
                Obx(() => _signInController.isLoading.value
                    ? const CircularProgressIndicator()
                    : CommonButton(
                        btnText: StringConst.signIn,
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.45,
                        onTap: () {
                          _signInController.signInWithEmail();
                        },
                        fontSize: 18,
                        textColor: AppColors.whiteTxtColor,
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
