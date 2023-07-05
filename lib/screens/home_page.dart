import 'package:astroquiz/common/common_button.dart';
import 'package:astroquiz/common/text.dart';
import 'package:astroquiz/config/colors.dart';
import 'package:astroquiz/config/common.dart';
import 'package:astroquiz/config/fonts.dart';
import 'package:astroquiz/config/images.dart';
import 'package:astroquiz/config/strings.dart';
import 'package:astroquiz/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import 'select_level_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController homePageController = Get.put(HomePageController());

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileScreen());
                    },
                    child: CircleAvatar(
                        backgroundColor: AppColors.btnColor.withOpacity(0.5),
                        child: const Icon(Icons.person)),
                  ),
                ],
              ),
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
              Flexible(
                child: Obx(
                  () => ListView.builder(
                    itemCount: homePageController.quizTypeList.length,
                    itemBuilder: (context, index) {
                      var type = homePageController.quizTypeList[index];
                      return Obx(() => questionTypeWidget(
                          typeName: type,
                          onTap: () {
                            homePageController.selectedType.value = type;
                          },
                          isSelected:
                              homePageController.selectedType.value == type));
                    },
                  ),
                ),
              ),
              CommonButton(
                btnText: StringConst.selectType,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.45,
                onTap: () {
                  Get.dialog(const SelectLevelDialog());
                },
                fontSize: 18,
                textColor: AppColors.whiteTxtColor,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget questionTypeWidget(
    {required String typeName,
    required bool isSelected,
    GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedColor : AppColors.tileBackColor,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        typeName,
        style: TextStyle(
            color: isSelected ? AppColors.black : AppColors.whiteTxtColor,
            fontSize: 16,
            fontFamily: MyFonts.nunito,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}
