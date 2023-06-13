class IQ {
  String? message;
  String? status;
  List<Question>? data;

  IQ({this.message, this.status, this.data});

  IQ.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Question>[];
      json['data'].forEach((v) {
        data!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  String? alias;
  String? quizTitle;
  String? question;
  String? answerTitle;
  String? type;
  String? inputType;
  List<String>? answerOptions;

  Question(
      {this.id,
        this.alias,
        this.quizTitle,
        this.question,
        this.answerTitle,
        this.type,
        this.inputType,
        this.answerOptions});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    quizTitle = json['quizTitle'];
    question = json['question'];
    answerTitle = json['answerTitle'];
    type = json['type'];
    inputType = json['inputType'];
    answerOptions = json['answerOptions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['quizTitle'] = this.quizTitle;
    data['question'] = this.question;
    data['answerTitle'] = this.answerTitle;
    data['type'] = this.type;
    data['inputType'] = this.inputType;
    data['answerOptions'] = this.answerOptions;
    return data;
  }
}
