import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_button.dart';
import '../config/colors.dart';
import '../config/fonts.dart';
import '../config/images.dart';
import '../config/strings.dart';
import '../controller/home_page_controller.dart';
import 'home_page.dart';
import 'question_screen.dart';

class SelectLevelDialog extends StatelessWidget {
  const SelectLevelDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomePageController>()
      ..selectedQuestionLevel.value = "";
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: Get.height * 0.50,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MyImages.commonBg), fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringConst.selectYourLevel,
                style: TextStyle(
                    color: AppColors.whiteTxtColor,
                    fontSize: 16,
                    fontFamily: MyFonts.nunito,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                  child: ListView.builder(
                itemCount: homeController.questionLevel.length,
                itemBuilder: (context, index) {
                  var level = homeController.questionLevel[index];
                  return Obx(() => questionTypeWidget(
                        typeName: level,
                        isSelected:
                            homeController.selectedQuestionLevel.value == level,
                        onTap: () {
                          homeController.selectedQuestionLevel.value = level;
                        },
                      ));
                },
              )),
              CommonButton(
                btnText: StringConst.selectLevel,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.45,
                onTap: () {
                  if (homeController.selectedQuestionLevel.value != "") {
                    Get.back();
                    Get.to(const QuestionScreen());
                  }
                },
                fontSize: 18,
                textColor: AppColors.whiteTxtColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
