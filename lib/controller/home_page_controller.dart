import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/model/question_model.dart';

class HomePageController extends GetxController {
  List<QuestionTypeModel> astroQuizData = [];
  RxList<String> quizTypeList = <String>[].obs;
  RxString selectedType = "".obs;
  RxString selectedQuestionLevel = "".obs;
  List<String> questionLevel = ["Easy", "Medium", "Hard"];

  @override
  void onInit() {
    getDataFromAsset();
    super.onInit();
  }

  getDataFromAsset() async {
    List<Map<String, dynamic>> data =
        await parseJsonFromAssets("assets/json/question_json.json");
    astroQuizData = data.map((e) => QuestionTypeModel.fromJson(e)).toList();
    for (var item in astroQuizData) {
      quizTypeList.add(item.questionType ?? "");
    }
    print(quizTypeList);
  }
}

Future<List<Map<String, dynamic>>> parseJsonFromAssets(
    String assetsPath) async {
  print('--- Parse json from: $assetsPath');
  List<dynamic> jsonData = await rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
  return jsonData.map((item) => item as Map<String, dynamic>).toList();
}
