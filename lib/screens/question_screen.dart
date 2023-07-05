import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../common/common_button.dart';
import '../config/colors.dart';
import '../config/fonts.dart';
import '../config/images.dart';
import '../config/strings.dart';
import '../controller/question_controller.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

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
        child: Column(children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: const Text(
              "Quiz",
              style: TextStyle(
                  color: AppColors.selectedColor,
                  fontSize: 25,
                  fontFamily: MyFonts.nunito,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: GetBuilder<QuestionController>(
              init: QuestionController(),
              builder: (controller) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              "${controller.currentQuestionIndex.value + 1}/${controller.questionDataList.length}",
                              style: const TextStyle(
                                  color: AppColors.selectedColor,
                                  fontSize: 18,
                                  fontFamily: MyFonts.nunito,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${controller.point} Point",
                              style: const TextStyle(
                                  color: AppColors.orange,
                                  fontSize: 18,
                                  fontFamily: MyFonts.nunito,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Countdown(
                            seconds: StringConst.counterSecond,
                            controller: controller.countdownController,
                            build: (BuildContext context, double time) => Text(
                                "Timer: ${secondToDurationForTimer(second: time)} ",
                                style: TextStyle(
                                    color: AppColors.whiteTxtColor,
                                    fontSize: 18,
                                    fontFamily: MyFonts.nunito,
                                    fontWeight: FontWeight.w600)),
                            interval: const Duration(seconds: 1),
                            onFinished: () {
                              controller.setNextQuestion();
                            },
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.tileBackColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          controller.currentQuestion.value.question ?? "",
                          style: TextStyle(
                              color: AppColors.whiteTxtColor,
                              fontSize: 16,
                              fontFamily: MyFonts.nunito,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller
                                  .currentQuestion.value.options?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var option = controller
                                .currentQuestion.value.options?[index];
                            return Obx(
                              () => optionWidget(
                                isSelected:
                                    controller.selectedOption.value == option,
                                typeName: option ?? "",
                                onTap: () {
                                  controller.selectedOption.value =
                                      option ?? "";
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CommonButton(
                        btnText: controller.currentQuestionIndex.value + 1 ==
                                controller.questionDataList.length
                            ? "Save"
                            : "Next Question",
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.45,
                        onTap: () {
                          if (controller.currentQuestionIndex.value + 1 ==
                              controller.questionDataList.length) {
                            controller.saveResult();
                          } else {
                            controller.setNextQuestion();
                          }
                        },
                        fontSize: 18,
                        textColor: AppColors.whiteTxtColor,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget optionWidget(
      {required String typeName,
      required bool isSelected,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.selectedColor : AppColors.transparent,
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
}

String secondToDurationForTimer({required double second}) {
  if (second != 0.0) {
    int convertedSecond = double.parse(second.toStringAsFixed(0)).toInt();
    Duration duration = Duration(seconds: convertedSecond);
    int minutes = duration.inMinutes.remainder(60);
    int remainingSeconds = duration.inSeconds.remainder(60);
    String formattedDuration =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  } else {
    return "00:00";
  }
}
