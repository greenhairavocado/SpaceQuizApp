class UserData {
  String? name;
  List<History>? history;
  String? userid;
  String? email;

  UserData({this.name, this.history, this.userid, this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
    userid = json['userid'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    data['userid'] = userid;
    data['email'] = email;
    return data;
  }
}

class History {
  String? date;
  String? level;
  String? percentage;
  int? correctAnswer;
  int? totalQuestion;
  String? type;

  History(
      {this.date,
      this.level,
      this.percentage,
      this.correctAnswer,
      this.totalQuestion,
      this.type});

  History.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    level = json['level'];
    percentage = json['percentage'];
    correctAnswer = json['correct_answer'];
    totalQuestion = json['total_question'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['level'] = level;
    data['percentage'] = percentage;
    data['correct_answer'] = correctAnswer;
    data['total_question'] = totalQuestion;
    data['type'] = type;
    return data;
  }
}
