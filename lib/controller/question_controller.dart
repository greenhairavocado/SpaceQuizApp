import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../data/model/question_model.dart';
import '../data/repository/quiz_repository.dart';
import '../screens/result_screen.dart';
import 'home_page_controller.dart';

class QuestionController extends GetxController {
  final CountdownController countdownController =
      CountdownController(autoStart: true);
  var homeController = Get.find<HomePageController>();

  RxInt currentQuestionIndex = (-1).obs;
  RxString selectedOption = "".obs;
  List<QuestionValue> questionDataList = [];
  RxList<String> option = <String>[].obs;
  Rx<QuestionValue> currentQuestion = QuestionValue().obs;
  RxInt correctAnswerCount = 0.obs;
  RxInt point = 0.obs;

  @override
  void onInit() {
    setQuestionData();
    super.onInit();
  }

  setQuestionData() {
    for (int i = 0; i < homeController.astroQuizData.length; i++) {
      var astroData = homeController.astroQuizData[i];
      if (astroData.questionType == homeController.selectedType.value) {
        for (int j = 0; j < (astroData.question?.length ?? 0); j++) {
          print(
              "${astroData.question?[j].questionLevel?.toLowerCase()} = ${homeController.selectedQuestionLevel.value.toLowerCase()}");
          if (astroData.question?[j].questionLevel?.toLowerCase() ==
              homeController.selectedQuestionLevel.value.toLowerCase()) {
            questionDataList.addAll(astroData.question?[j].value ?? []);
            currentQuestionIndex.value = 0;
          }
        }
      }
    }
    setCurrentQuestion();
  }

  setCurrentQuestion() {
    currentQuestion.value = questionDataList[currentQuestionIndex.value];
  }

  setNextQuestion() {
    if ((currentQuestionIndex.value + 1) != questionDataList.length) {
      checkSubmittedAnswer();
      currentQuestionIndex.value++;
      currentQuestion.value = questionDataList[currentQuestionIndex.value];
      countdownController.restart();
      selectedOption.value = "";
    }
  }

  checkSubmittedAnswer() {
    if (selectedOption.value != "") {
      if (selectedOption.value ==
          questionDataList[currentQuestionIndex.value].answer) {
        correctAnswerCount++;
        point.value += 10;
        print(correctAnswerCount);
      }
    }
  }

  saveResult() async {
    checkSubmittedAnswer();
    double percentage =
        (correctAnswerCount.value / questionDataList.length) * 100;
    await QuizRepository.setResult({
      "date": DateTime.now().toString(),
      "percentage": percentage.toStringAsFixed(2),
      "correct_answer": correctAnswerCount.value,
      "total_question": questionDataList.length,
      "level": homeController.selectedQuestionLevel.value,
      "type": homeController.selectedType.value
    });
    Get.off(ResultScreen(
      correctAnswer: correctAnswerCount.value,
      totalQuestion: questionDataList.length,
      score: percentage,
    ));
  }
}
