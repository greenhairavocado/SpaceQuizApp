class QuestionTypeModel {
  String? questionType;
  List<Question>? question;

  QuestionTypeModel({this.questionType, this.question});

  QuestionTypeModel.fromJson(Map<String, dynamic> json) {
    questionType = json['question_type'];
    if (json['questions'] != null) {
      question = <Question>[];
      json['questions'].forEach((v) {
        question!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_type'] = questionType;
    if (question != null) {
      data['questions'] = question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String? questionLevel;
  List<QuestionValue>? value;

  Question({this.questionLevel, this.value});

  Question.fromJson(Map<String, dynamic> json) {
    questionLevel = json['question_level'];
    if (json['value'] != null) {
      value = <QuestionValue>[];
      json['value'].forEach((v) {
        value!.add(QuestionValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_level'] = questionLevel;
    if (value != null) {
      data['value'] = value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionValue {
  String? question;
  List<String>? options;
  String? answer;

  QuestionValue({this.question, this.options, this.answer});

  QuestionValue.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['answer'] = answer;
    return data;
  }
}
