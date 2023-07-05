import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../config/fonts.dart';
import '../config/images.dart';
import '../config/strings.dart';

class ResultScreen extends StatelessWidget {
  final double score;
  final int totalQuestion;
  final int correctAnswer;

  const ResultScreen(
      {Key? key,
      required this.score,
      required this.totalQuestion,
      required this.correctAnswer})
      : super(key: key);

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.whiteTxtColor,
                  )),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: AppColors.tileBackColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  const SizedBox(height: 10),
                  getTrophy(score) == ""
                      ? const SizedBox()
                      : Image.asset(
                          getTrophy(score),
                          height: 125,
                          width: 125,
                        ),
                  const SizedBox(height: 10),
                  Text(getMessage(score),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontSize: 22,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text("${score.toStringAsFixed(2)}% ${StringConst.score} ",
                      style: const TextStyle(
                          color: AppColors.greenColor,
                          fontSize: 24,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  Text(StringConst.quizCompletedSuccessfully,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontSize: 18,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.whiteTxtColor,
                        fontSize: 18,
                        fontFamily: MyFonts.nunito,
                        fontWeight: FontWeight.w700),
                    TextSpan(
                      children: [
                        const TextSpan(text: StringConst.youAttempt),
                        TextSpan(
                          text: '$totalQuestion ${StringConst.questions} ',
                          style: const TextStyle(
                              color: AppColors.blueColor,
                              fontSize: 18,
                              fontFamily: MyFonts.nunito,
                              fontWeight: FontWeight.w900),
                        ),
                        const TextSpan(text: '${StringConst.andFromThat} '),
                        TextSpan(
                          text: '$correctAnswer ${StringConst.answer} ',
                          style: const TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 18,
                              fontFamily: MyFonts.nunito,
                              fontWeight: FontWeight.w900),
                        ),
                        const TextSpan(text: StringConst.isCorrect),
                      ],
                    ),
                  )
                ]),
              ),
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.close,
                    color: AppColors.transparent,
                  )),
            ]),
      ),
    );
  }
}

getTrophy(double score) {
  if ((score) >= 90) {
    return MyImages.goldTrophy;
  } else if (score >= 80) {
    return MyImages.silverTrophy;
  } else if (score >= 70) {
    return MyImages.bronzeMadel;
  } else {
    return '';
  }
}

getMessage(double score) {
  if ((score) >= 90) {
    return StringConst.goldMedalMessage;
  } else if (score >= 80) {
    return StringConst.silverMedalMessage;
  } else if (score >= 70) {
    return StringConst.bronzeMedalMessage;
  } else {
    return StringConst.defaultMessage;
  }
}
