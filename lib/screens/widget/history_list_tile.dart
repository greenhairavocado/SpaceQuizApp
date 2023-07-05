import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../config/colors.dart';
import '../../config/date_time_format.dart';
import '../../config/fonts.dart';
import '../../config/images.dart';

class HistoryListTile extends StatelessWidget {
  final String date;
  final String level;
  final String percentage;
  final int correctAnswer;
  final int totalQuestion;
  final String type;

  const HistoryListTile({
    super.key,
    required this.date,
    required this.level,
    required this.percentage,
    required this.correctAnswer,
    required this.totalQuestion,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Card(
        color: AppColors.tileBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: double.parse(percentage) / 100,
                center: Text('$correctAnswer / $totalQuestion',
                    style: TextStyle(
                        color: AppColors.whiteTxtColor,
                        fontFamily: MyFonts.nunito,
                        fontWeight: FontWeight.w700)),
                progressColor: AppColors.greenColor,
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontFamily: MyFonts.nunito,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  Text('$percentage%',
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                  Text(dateConvert(date),
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                ],
              )),
              const SizedBox(width: 10.0),
              Column(
                children: [
                  Text(level,
                      style: TextStyle(
                          color: AppColors.whiteTxtColor,
                          fontFamily: MyFonts.nunito,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 5,
                  ),
                  getMadel() == ""
                      ? const SizedBox()
                      : Image.asset(
                          getMadel(),
                          width: 45,
                          height: 45,
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getMadel() {
    var score = double.parse(percentage);
    if ((score) >= 90) {
      return MyImages.goldMadel;
    } else if (score >= 80) {
      return MyImages.silverMadel;
    } else if (score >= 70) {
      return MyImages.bronzeMadel;
    } else {
      return '';
    }
  }
}
