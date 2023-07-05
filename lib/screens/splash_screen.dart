
import 'package:astroquiz/config/colors.dart';
import 'package:astroquiz/config/common.dart';
import 'package:astroquiz/config/fonts.dart';
import 'package:astroquiz/config/images.dart';
import 'package:astroquiz/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/text.dart';
import '../controller/splash_controller.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());

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
                image: AssetImage(MyImages.screenBgImage), fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              bottom: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            children: [
              Image.asset(MyImages.quizIcon, height: 200, width: 150),
              spaceWidgetHeight(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Column(
                children: [
                  text(
                      text: StringConst.letsPlay,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontSize: 18,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                  text(
                      text: StringConst.playNowAndLevelString,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontSize: 14,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              spaceWidgetHeight(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
